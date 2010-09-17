/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.argmaps.ejb;

import com.argmaps.entity.Customer;
import com.argmaps.entity.DiscountCode;
import java.io.Serializable;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.ejb.LocalBean;
import javax.ejb.Stateless;
import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageProducer;
import javax.jms.ObjectMessage;
import javax.jms.Queue;
import javax.jms.Session;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

@Stateless
@LocalBean
public class CustomerSessionBean
{
    @Resource(name = "jms/NotificationQueue")
    private Queue notificationQueue;
    @Resource(name = "jms/NotificationQueueFactory")
    private ConnectionFactory notificationQueueFactory;
    @PersistenceContext
    private EntityManager em;

    /**
     * Returns a list of Customer objects in the database
     * @return List<Customer>
     */
    public List<Customer> retrieve()
    {
        Query query = em.createNamedQuery("Customer.findAll");
        return query.getResultList();
    }

    /**
     * Update the customer record
     * @param customer
     * @return Customer updated Customer object
     */
    public Customer update(Customer customer)
    {
        Customer updated = em.merge(customer);
        try
        {
            sendJMSMessageToNotificationQueue(updated);
        }
        catch (JMSException ex)
        {
            Logger.getLogger(CustomerSessionBean.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("Customer updated in CustomerSessionBean!");
        return updated;
    }

    /**
     * Included here for convenience rather than creating a new Session Bean
     * @return List<DiscountCode>
     */
    public List<DiscountCode> getDiscountCodes()
    {
        Query query = em.createNamedQuery("DiscountCode.findAll");
        return query.getResultList();
    }

    public void persist(Object object)
    {
        em.persist(object);
    }

    private Message createJMSMessageForjmsNotificationQueue(Session session, Object messageData) throws JMSException
    {
        //Modified to use ObjectMessage instead
        ObjectMessage tm = session.createObjectMessage();
        tm.setObject((Serializable) messageData);
        return tm;
    }

    private void sendJMSMessageToNotificationQueue(Object messageData) throws JMSException
    {
        Connection connection = null;
        Session session = null;
        try
        {
            connection = notificationQueueFactory.createConnection();
            session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
            MessageProducer messageProducer = session.createProducer(notificationQueue);
            messageProducer.send(createJMSMessageForjmsNotificationQueue(session, messageData));
        }
        finally
        {
            if (session != null)
            {
                try
                {
                    session.close();
                }
                catch (JMSException e)
                {
                    Logger.getLogger(this.getClass().getName()).log(Level.WARNING, "Cannot close session", e);
                }
            }
            if (connection != null)
            {
                connection.close();
            }
        }
    }

    
    // Add business logic below. (Right-click in editor and choose
    // "Insert Code > Add Business Method")
}
