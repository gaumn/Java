package com.gaumn.dao;

import java.io.Serializable;
import java.util.List;

/**
 * @ Creat by gaumn on  2020/9/27
 **/
public interface CommonDao<E,PK extends Serializable> {
    public List<E> getAll();

    public E get(PK id);

    public void add(E user);

    public void delete(PK id);

    public void update(E user);

    public List<E> getList(E condition);
}
