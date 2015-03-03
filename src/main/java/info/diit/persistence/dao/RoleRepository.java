package info.diit.persistence.dao;

import info.diit.persistence.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Long> {

	public Role findByName(String name);
    public void delete(Role role);
    
}
