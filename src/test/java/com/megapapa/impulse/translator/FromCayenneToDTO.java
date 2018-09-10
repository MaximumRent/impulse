package com.megapapa.impulse.translator;

import com.megapapa.impulse.entity.cayenne.IndividualTask;
import com.megapapa.impulse.entity.cayenne.Role;
import com.megapapa.impulse.entity.cayenne.User;
import org.junit.Test;

import java.util.Map;

public class FromCayenneToDTO {

    @Test
    public void testCayenneToDTO() {
        Role role = new Role();
        role.setName("admin");
        User user = new User();
        user.setEmail("email");
        user.setPasswordHash("ASDF");
        user.setPasswordSalt("IIIIIEIEIEIE");
        user.writePropertyDirectly("role", role);
        IndividualTask itask = new IndividualTask();
        itask.setName("nuame");
        itask.setDescription("desc");
        itask.writePropertyDirectly("user", user);
        Retranslator retranslator = new Retranslator();
        retranslator.startTranslation()


        Map<String, Object> jsonMap = new Retranslator().translate(itask);
        jsonMap.forEach((key, value) -> {
            System.out.println(key + " : " + value);
        });
    }
}
