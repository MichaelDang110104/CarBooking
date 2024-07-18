package HSF301_Assignment_Spring_MVC.services.googleAuthen;

import HSF301_Assignment_Spring_MVC.repositories.CustomerRepository;
import HSF301_Assignment_Spring_MVC.services.ICustomerService;
import HSF301_Assignment_Spring_MVC.services.Implements.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailService implements UserDetailsService {


    @Autowired
    private CustomerRepository customerRepository;
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return new UserDetail(customerRepository.findByEmail(username));
    }
}
