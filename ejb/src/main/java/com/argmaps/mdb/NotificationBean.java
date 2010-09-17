/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.argmaps.mdb;

import com.argmaps.entity.Customer;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.ejb.ActivationConfigProperty;
import javax.ejb.MessageDriven;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageListener;
import javax.jms.ObjectMessage;

@MessageDriven(mappedName = "jms/NotificationQueue", activationConfig =
{
    @ActivationConfigProperty(propertyName = "acknowledgeMode", propertyValue = "Auto-acknowledge"),
    @ActivationConfigProperty(propertyName = "destinationType", propertyValue = "javax.jms.Queue")
})
public class NotificationBean implements MessageListener
{
    public NotificationBean()
    {
    }

    public void onMessage(Message message)
    {
        try
        {
            Object msgObj = ((ObjectMessage)message).getObject();
            if (msgObj != null)
            {
                Customer customer = (Customer)msgObj;
                System.out.println("Customer with the following details has been updated:");
                StringBuilder sb = new StringBuilder();
                sb.append("Customer ID=");
                sb.append(customer.getCustomerId());
                sb.append(", ");
                sb.append("Name=");
                sb.append(customer.getName());
                sb.append(", ");
                sb.append("Email=");
                sb.append(customer.getEmail());
                System.out.println(sb.toString());
            }
        }
        catch (JMSException ex)
        {
            Logger.getLogger(NotificationBean.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
