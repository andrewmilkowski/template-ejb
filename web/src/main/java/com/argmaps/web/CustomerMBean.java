package com.argmaps.web;

import com.argmaps.ejb.CustomerSessionBean;
import com.argmaps.entity.Customer;
import com.argmaps.entity.DiscountCode;
import java.security.Principal;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.SessionScoped;
import javax.faces.context.FacesContext;
import javax.faces.model.SelectItem;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@ManagedBean(name = "customer")
@SessionScoped
public class CustomerMBean
{

    @EJB
    private CustomerSessionBean customerSessionBean;
    private Customer customer;

    public CustomerMBean()
    {
    }

    /**
     * Returns list of customer objects to be displayed in the data table
     * @return
     */
    public List<Customer> getCustomers()
    {
        return customerSessionBean.retrieve();
    }

    /**
     * Returns the selected Customer object
     * @return
     */
    public Customer getDetails()
    {
        //Can either do this for simplicity or fetch the details again from the
        //database using the Customer ID
        return customer;
    }

    /**
     * Returns an array of SelectItem to be displayed in the DiscountCode
     * Dropdown list in the CustomerDetails page
     * @return
     */
    public javax.faces.model.SelectItem[] getDiscountCodes()
    {
        SelectItem[] options = null;
        List<DiscountCode> discountCodes = customerSessionBean.getDiscountCodes();
        if (discountCodes != null && discountCodes.size() > 0)
        {
            int i = 0;
            options = new SelectItem[discountCodes.size()];
            for (DiscountCode dc : discountCodes)
            {
                options[i++] = new SelectItem(dc.getDiscountCode(),
                        dc.getDiscountCode() + " (" + dc.getRate() + "%)");
            }
        }
        return options;
    }

    /**
     * Action handler - user selects a customer record from the list
     * (data table) to view/edit
     * @param customer
     * @return
     */
    public String showDetails(Customer customer)
    {
        this.customer = customer;
        return "DETAILS";
    }

    /**
     * Action handler - update the changes in the Customer object to the
     * database
     * @return
     */
    public String update()
    {
        System.out.println("###UPDATE###");
        customer = customerSessionBean.update(customer);
        return "SAVED";
    }

    /**
     * Action handler - goes to the Customer listing page
     * @return
     */
    public String list()
    {
        System.out.println("###LIST###");
        return "LIST";
    }

    /**
     *
     * @return Principal of the logged-in user
     */
    private Principal getLoggedInUser()
    {
        HttpServletRequest request =
                (HttpServletRequest) FacesContext.getCurrentInstance().
                    getExternalContext().getRequest();
        return request.getUserPrincipal();
    }

    /**
     * Property
     * @return true if user is logged in, false otherwise
     */
    public boolean isUserNotLogin()
    {
        Principal loginUser = getLoggedInUser();
        if (loginUser == null)
        {
            return true;
        }
        return false;
    }

    /**
     * Property
     * @return Username of the logged-in user
     */
    public String getLoginUserName()
    {
        Principal loginUser = getLoggedInUser();
        if (loginUser != null)
        {
            return loginUser.getName();
        }
        return "None";
    }

    /**
     * Action handler - logout
     * @return outcome string for pageflow definition
     */
    public String logout()
    {
        HttpServletRequest request =
                (HttpServletRequest) FacesContext.getCurrentInstance().
                getExternalContext().getRequest();

        Principal loginUser = getLoggedInUser();
        if (loginUser != null)
        {
            HttpSession session = request.getSession(false);
            if (session != null)
            {
                session.invalidate();
            }
        }
        return "LOGOUT";
    }
}
