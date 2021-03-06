package info.diit.security;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import info.diit.persistence.dao.RoleRepository;
import info.diit.persistence.dao.UserRepository;
import info.diit.persistence.model.Privilege;
import info.diit.persistence.model.Role;
import info.diit.persistence.model.User;
import info.diit.persistence.service.IUserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("userDetailsService")
@Transactional
public class MyUserDetailsService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private IUserService service;
    @Autowired
    private MessageSource messages;
    @Autowired
    private RoleRepository roleRepository;

    public MyUserDetailsService() {
        super();
    }

  
    // API
    public UserDetails loadUserByUsername(final String email) throws UsernameNotFoundException {
        
    	try {
            final User user = userRepository.findByEmail(email);
           
            if (user == null) {
            	System.out.println("################# loadUserByUsername null #############################");
                return new org.springframework.security.core.userdetails.User(" ", " ", true, true, true, true, getAuthorities(Arrays.asList(roleRepository.findByName("ROLE_USER"))));
            }
            System.out.println("################# loadUserByUsername #############################");
                return new org.springframework.security.core.userdetails.User(user.getEmail(),user.getPassword(),user.isEnabled(), true, true, true, getAuthorities(user.getRoles()));
        } catch (final Exception e) {
            throw new RuntimeException(e);
        }
    }

    // UTIL

    private final Collection<? extends GrantedAuthority> getAuthorities(final Collection<Role> roles) {
        return getGrantedAuthorities(getPrivileges(roles));
    }

    private final List<String> getPrivileges(final Collection<Role> roles) {
        final List<String> privileges = new ArrayList<String>();
        final List<Privilege> collection = new ArrayList<Privilege>();
        for (Role role : roles) {
            collection.addAll(role.getPrivileges());
        }
        for (final Privilege item : collection) {
            privileges.add(item.getName());
        }
        return privileges;
    }

    private final List<GrantedAuthority> getGrantedAuthorities(final List<String> privileges) {
        final List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        for (final String privilege : privileges) {
            authorities.add(new SimpleGrantedAuthority(privilege));
        }
        return authorities;
    }
}
