package info.diit.persistence.dao;

import info.diit.persistence.model.Privilege;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PrivilegeRepository extends JpaRepository<Privilege, Long> {
	
    public Privilege findByName(String name);

    public void delete(Privilege privilege);
}
