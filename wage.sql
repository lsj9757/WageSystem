
CREATE TABLE employee (
  employeeNo char(4) NOT NULL,
  title varchar(10) NOT NULL,
  firstName varchar(5) NOT NULL,
  middleName varchar(5) NOT NULL,
  lastName varchar(5) NOT NULL,
  address varchar(30) NOT NULL,
  workTelExt char(11) NOT NULL,
  homeTelNo char(11) NOT NULL,
  empEmailAddress char(50) NOT NULL,
  socialSecurityNumber char(9) NOT NULL,
  DOB date NOT NULL,
  position varchar(30) NOT NULL,
  sex enum('男','女') NOT NULL,
  salary float NOT NULL,
  dateStarted date NOT NULL,
  primary key (employeeNo),
  UNIQUE (socialSecurityNumber)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE bonus (
  employeeNo char(4) NOT NULL,
  bonusDate date NOT NULL,
  bonusAmount float NOT NULL,
  bonusTypeNo char(5) NOT NULL,
  primary key(employeeNo,bonusDate)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE bonustype (
  bonusTypeNo char(5) NOT NULL ,
  bonusDescription varchar(40) NOT NULL,
  primary key (bonusTypeNo)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE deduction (
  employeeNo char(4) NOT NULL , 
  deductDate date NOT NULL ,
  deductAmount float NOT NULL,
  deductTypeNo char(5) NOT NULL,
  primary key(employeeNo,deductDate)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE deducttype (
  deductTypeNo char(5) NOT NULL,
  deductDescription varchar(40) NOT NULL,
  primary key (deductTypeNo)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE holiday (
  employeeNo char(4) NOT NULL ,
  startDate date NOT NULL ,
  endDate date NOT NULL,
  primary key(employeeNo,startDate)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE paydetails (
  employeeNo char(4) NOT NULL ,
  startDate date NOT NULL ,
  routingNumber char(9) NOT NULL,
  accountType varchar(10) NOT NULL,
  bankName varchar(16) NOT NULL,
  bankAddress varchar(30) NOT NULL,
  payTypeNo char(5) NOT NULL,
  primary key(employeeNo,startDate)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE payhistory (
  payNo char(6) NOT NULL,
  employeeNo char(4) NOT NULL,
  payDate date NOT NULL,
  checkNumber char(4) NOT NULL,
  payAmount float NOT NULL,
  primary key(payNo)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE paytype (
  payTypeNo char(5) NOT NULL,
  payTypeDescription varchar(50) NOT NULL,
  primary key(payTypeNo)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE sickleave (
  employeeNo char(4) NOT NULL ,
  startDate date NOT NULL ,
  endDate date NOT NULL,
  reason varchar(40) NOT NULL,
  primary key(employeeNo,startDate)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;



ALTER TABLE employee
  ALTER salary SET DEFAULT 0,
  ADD CONSTRAINT C_employee_employeeNo CHECK (employeeNo BETWEEN 0000 and 9999),
  ADD CONSTRAINT C_employee_classification1 CHECK (cast(workTelExt as SIGNED INTEGER)>0 AND cast(homeTelNo as SIGNED INTEGER)>0 AND cast(socialSecurityNumber as SIGNED INTEGER)>0),
  ADD CONSTRAINT C_employee_classification2 CHECK (DOB BETWEEN cast('1950-01-01' as date) and cast('2018-01-01' as date) AND dateStarted BETWEEN cast('2000-01-01' as date) and cast('2018-01-01' as date));



ALTER TABLE bonus
  ADD CONSTRAINT C_bonus_employeeNo CHECK (employeeNo BETWEEN 0000 and 9999),
  ADD CONSTRAINT C_bonus_bonusAmount CHECK (bonusAmount>0),
  ADD CONSTRAINT C_bonus_bonusDate CHECK (bonusDate BETWEEN cast('2000-01-01' as date) and cast('2018-01-01' as date)),
  ADD CONSTRAINT F_bonus_employeeNo foreign KEY (employeeNo) REFERENCES employee(employeeNo),
  ADD CONSTRAINT F_bonus_bonusTypeNo foreign KEY (bonusTypeNo) REFERENCES bonustype(bonusTypeNo);



ALTER TABLE deduction
  ADD CONSTRAINT C_deduction_employeeNo CHECK (employeeNo BETWEEN 0000 and 9999),
  ADD CONSTRAINT C_deduction_deductAmount CHECK (deductAmount>0),
  ADD CONSTRAINT C_deduction_deductDate CHECK (deductDate BETWEEN cast('2000-01-01' as date) and cast('2018-01-01' as date)),
  ADD CONSTRAINT F_deduction_employeeNo foreign KEY (employeeNo) REFERENCES employee(employeeNo),
  ADD CONSTRAINT F_deduction_deductTypeNo foreign KEY (deductTypeNo) REFERENCES deducttype(deductTypeNo);


ALTER TABLE holiday
  ADD CONSTRAINT C_holiday_employeeNo CHECK (employeeNo BETWEEN 0000 and 9999),
  ADD CONSTRAINT C_holiday_classification CHECK (startDate BETWEEN cast('2000-01-01' as date) and cast('2018-01-01' as date) AND endDate BETWEEN cast('2000-01-01' as date) and cast('2018-01-01' as date)),
  ADD CONSTRAINT F_holiday_employeeNo foreign KEY (employeeNo) REFERENCES employee(employeeNo);



ALTER TABLE paydetails
  ADD CONSTRAINT C_paydetails_employeeNo CHECK (employeeNo BETWEEN 0000 and 9999),
  ADD CONSTRAINT C_paydetails_routingNumber CHECK (cast(routingNumber as SIGNED INTEGER)>0),
  ADD CONSTRAINT C_paydetails_startDate CHECK (startDate BETWEEN cast('2000-01-01' as date) and cast('2018-01-01' as date)),
  ADD CONSTRAINT F_paydetails_employeeNo foreign KEY (employeeNo) REFERENCES employee(employeeNo),
  ADD CONSTRAINT F_paydetails_payTypeNo foreign KEY (payTypeNo) REFERENCES paytype(payTypeNo);


ALTER TABLE payhistory
  ADD CONSTRAINT C_payhistory_employeeNo CHECK (employeeNo BETWEEN 0000 and 9999),
  ADD CONSTRAINT C_payhistory_payAmount CHECK (payAmount>0),
  ADD CONSTRAINT C_payhistory_checkNumber CHECK (cast(checkNumber as SIGNED INTEGER)>0),
  ADD CONSTRAINT C_payhistory_payDate CHECK (payDate BETWEEN cast('2000-01-01' as date) and cast('2018-01-01' as date)),
  ADD CONSTRAINT F_payhistory_employeeNo foreign KEY (employeeNo) REFERENCES employee(employeeNo);


ALTER TABLE sickleave
  ADD CONSTRAINT C_sickleave_employeeNo CHECK (employeeNo BETWEEN 0000 and 9999),
  ADD CONSTRAINT C_sickleave_classification CHECK (startDate BETWEEN cast('2000-01-01' as date) and cast('2018-01-01' as date) AND endDate BETWEEN cast('2000-01-01' as date) and cast('2018-01-01' as date)),
  ADD CONSTRAINT F_sickleave_employeeNo foreign KEY (employeeNo) REFERENCES employee(employeeNo);