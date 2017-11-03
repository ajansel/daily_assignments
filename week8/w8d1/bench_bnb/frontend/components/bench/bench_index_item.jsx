import React from 'react';

const BenchIndexItem = ({bench}) => {
  return (
    <li key={bench.id+"li"}>
      Description: {bench.description}
    </li>
  );
};

export default BenchIndexItem;
