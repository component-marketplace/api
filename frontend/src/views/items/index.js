import React from 'react';
import { Link } from 'react-router-dom';
import styled from 'styled-components';
import { useItemsContext } from '../../contexts/ItemsContext';

const Items = styled((props) => {
  const { className } = props;
  const { items, refetch } = useItemsContext();
  const createItem = async() => {
    await fetch(`http://localhost:3000/v1/items?name=New Item&description=A brand new item`, {method: 'post'});
    refetch();
  };

  return(
    <div className={className}>
      <h1>Overview</h1>
      <div className='overview-container'>
        <div>You have 5 critical actions</div>
        <div>Your sales are up 10% this month</div>
        <div>There are cheaper components available for you</div>
      </div>
      <h1>Your Items</h1>
      <div className='items-container'>
        <div className='add-new' onClick={() => createItem()}>+ Add New</div>
        {items?.map(item => {
          return (
            <Link to={`/items/${item.id}`} key={item.id}>
              <div className='item'>{item.name}</div>
            </Link>
          )
        })}
      </div>
    </div>
  )
})`
  width: 100%;

  .overview-container {
    padding: 50px;
    width: 75%;
    margin: auto;
    border: 5px solid #89CFF0;
    border-radius: 5px;
    overflow-x: auto;
    display: flex;
    justify-content: space-evenly;

    > * {
      background-color: #89CFF0;
      color: white;
      padding: 50px;
      margin: 10px;
      display: flex;
      flex-wrap: wrap;
      width: 250px;
      justify-content: center;
      text-align: center;
      border-radius: 5px;
    }
  }

  .items-container {
    padding: 50px;
    width: 100%;
    display: flex;
    flex-wrap: wrap;
    gap: 50px;
    box-sizing: border-box;

    .add-new {
      background-color: white;
      border: 3px solid pink;
      padding: 50px;
      border-radius: 5px;
      cursor: pointer;
    }

    .item {
      background-color: pink;
      padding: 50px;
      border-radius: 5px;
    }
  }
`;

export default Items;
