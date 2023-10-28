package dao;

import entity.Employee;
import utils.JpaUtils;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import java.util.List;

public class EmployeeDAO {
    private EntityManager em = JpaUtils.getEntityManager();
    @Override
    protected  void finalize() throws Throwable{
        em.close();
        super.finalize();
    }

    public Employee create (Employee entity){
        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
            return entity;
        }catch (Exception e){
            e.printStackTrace();
            em.getTransaction().rollback();
            throw new RuntimeException(e);
        }
    }

    public Employee update(Employee entity){
        try {
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
            return entity;
        }catch (Exception e){
            e.printStackTrace();
            em.getTransaction().rollback();
            throw new RuntimeException(e);
        }
    }

    public Employee remove(int id){
        try {
            em.getTransaction().begin();
            Employee entity = this.findById(id);
            em.remove(entity);
            em.getTransaction().commit();
            return entity;
        }catch (Exception e){
            em.getTransaction().rollback();
            throw new RuntimeException(e);
        }
    }

    public Employee findById(int id) {
        return em.find(Employee.class, id);
    }

    //Tim kiem phan trang
    public List<Employee> findPage(int page, int size){
        String jpql = "Select o from Employee o";
        TypedQuery<Employee> query = em.createQuery(jpql, Employee.class);
        query.setFirstResult(page*size);
        query.setMaxResults(size);
        return  query.getResultList();
    }

    public List<Employee> searchStudents(String keyword) {
        String jpql = "SELECT s FROM Employee s WHERE s.name LIKE :keyword";
        TypedQuery<Employee> query = em.createQuery(jpql, Employee.class);
        query.setParameter("keyword", "%" + keyword + "%");
        return query.getResultList();
    }


    public List<Employee> findAll() {
        String jpql = "SELECT o FROM Employee o ORDER BY o.id DESC";
        TypedQuery<Employee> query = em.createQuery(jpql, Employee.class);
        return query.getResultList();
    }






}
