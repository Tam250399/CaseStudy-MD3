package customer;

import java.util.List;

public interface customerService {
    List<person> findAll();
    void  save (person persons);
    person findById(int id);
   boolean update(int id , person persons);
    boolean remove (int id);
}
