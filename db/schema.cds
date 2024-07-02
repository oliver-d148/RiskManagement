namespace RiskManagement;

using { BusinessPartnerA2X } from '../srv/external/BusinessPartnerA2X.cds';

using
{
    Country,
    Currency,
    Language,
    User,
    cuid,
    extensible,
    managed,
    temporal
}
from '@sap/cds/common';

entity Risks
{
    title : String(100);
    prio : String(5);
    descr : String(100);
    impact : Integer;
    criticality : Integer;
    key ID : UUID;
    miti : Association to one Mitigations;
    supplier : Association to one BusinessPartnerA2X.A_BusinessPartner;
}

entity Mitigations
{
    createdAt : String(100);
    createdBy : String(100);
    description : String(100);
    owner : String(100);
    timeline : String(100);
    key ID : UUID;
    risks : Association to many Risks on risks.miti = $self;
}
