package com.megapapa.impulse.entity.cayenne.auto;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.List;

import org.apache.cayenne.BaseDataObject;
import org.apache.cayenne.exp.Property;

import com.megapapa.impulse.entity.cayenne.RolePermission;
import com.megapapa.impulse.entity.cayenne.User;

/**
 * Class _Role was generated by Cayenne.
 * It is probably a good idea to avoid changing this class manually,
 * since it may be overwritten next time code is regenerated.
 * If you need to make any customizations, please use subclass.
 */
public abstract class _Role extends BaseDataObject {

    private static final long serialVersionUID = 1L; 

    public static final String ID_PK_COLUMN = "id";

    public static final Property<String> NAME = Property.create("name", String.class);
    public static final Property<List<RolePermission>> ROLE_PERMISSIONS = Property.create("rolePermissions", List.class);
    public static final Property<List<User>> USERS = Property.create("users", List.class);

    protected String name;

    protected Object rolePermissions;
    protected Object users;

    public void setName(String name) {
        beforePropertyWrite("name", this.name, name);
        this.name = name;
    }

    public String getName() {
        beforePropertyRead("name");
        return this.name;
    }

    public void addToRolePermissions(RolePermission obj) {
        addToManyTarget("rolePermissions", obj, true);
    }

    public void removeFromRolePermissions(RolePermission obj) {
        removeToManyTarget("rolePermissions", obj, true);
    }

    @SuppressWarnings("unchecked")
    public List<RolePermission> getRolePermissions() {
        return (List<RolePermission>)readProperty("rolePermissions");
    }

    public void addToUsers(User obj) {
        addToManyTarget("users", obj, true);
    }

    public void removeFromUsers(User obj) {
        removeToManyTarget("users", obj, true);
    }

    @SuppressWarnings("unchecked")
    public List<User> getUsers() {
        return (List<User>)readProperty("users");
    }

    @Override
    public Object readPropertyDirectly(String propName) {
        if(propName == null) {
            throw new IllegalArgumentException();
        }

        switch(propName) {
            case "name":
                return this.name;
            case "rolePermissions":
                return this.rolePermissions;
            case "users":
                return this.users;
            default:
                return super.readPropertyDirectly(propName);
        }
    }

    @Override
    public void writePropertyDirectly(String propName, Object val) {
        if(propName == null) {
            throw new IllegalArgumentException();
        }

        switch (propName) {
            case "name":
                this.name = (String)val;
                break;
            case "rolePermissions":
                this.rolePermissions = val;
                break;
            case "users":
                this.users = val;
                break;
            default:
                super.writePropertyDirectly(propName, val);
        }
    }

    private void writeObject(ObjectOutputStream out) throws IOException {
        writeSerialized(out);
    }

    private void readObject(ObjectInputStream in) throws IOException, ClassNotFoundException {
        readSerialized(in);
    }

    @Override
    protected void writeState(ObjectOutputStream out) throws IOException {
        super.writeState(out);
        out.writeObject(this.name);
        out.writeObject(this.rolePermissions);
        out.writeObject(this.users);
    }

    @Override
    protected void readState(ObjectInputStream in) throws IOException, ClassNotFoundException {
        super.readState(in);
        this.name = (String)in.readObject();
        this.rolePermissions = in.readObject();
        this.users = in.readObject();
    }

}
