package subject.store.supplement.service;

import subject.store.supplement.entities.User;

public interface LoginService {
    User validateLogin(String username, String password);
}
