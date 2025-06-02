import React, { useState, useEffect } from 'react';
import { ArrowLeft, Mail, Phone, Calendar, MapPin, Edit, Trash2, Copy, Check, User, Briefcase } from 'lucide-react';

        const FacultyDetailsCard = () => {
        const [animationStarted, setAnimationStarted] = useState(false);
  const [copiedItem, setCopiedItem] = useState('');
  const [showDeleteDialog, setShowDeleteDialog] = useState(false);

// Sample faculty data
  const faculty = {
name: "Dr. Sarah Johnson",
designation: "Associate Professor",
department: "Computer Science & Engineering",
email: "sarah.johnson@university.edu",
contact: "+1 (555) 123-4567",
dateOfBirth: "March 15, 1985",
address: "123 University Avenue, Academic City, AC 12345"
        };

useEffect(() => {
setAnimationStarted(true);
  }, []);

          const copyToClipboard = (text, label) => {
        navigator.clipboard.writeText(text);
setCopiedItem(label);
setTimeout(() => setCopiedItem(''), 2000);
        };

        const ContactCard = ({ icon: Icon, label, value, color, onCopy }) => (
    <div
onClick={() => onCopy && onCopy()}
className={`p-4 bg-white rounded-2xl border-2 cursor-pointer transition-all duration-300 hover:shadow-lg ${
color === 'red' ? 'border-red-100 hover:border-red-200' : 'border-orange-100 hover:border-orange-200'
        }`}
style={{
boxShadow: color === 'red'
        ? '0 2px 8px rgba(166, 44, 44, 0.1)'
        : '0 2px 8px rgba(232, 63, 37, 0.1)'
        }}
        >
      <div className="flex items-center">
        <div className={`p-2.5 rounded-xl ${
color === 'red' ? 'bg-red-50' : 'bg-orange-50'
        }`}>
          <Icon className={`w-5 h-5 ${
    color === 'red' ? 'text-red-600' : 'text-orange-600'
}`} />
        </div>
        <div className="ml-4 flex-1">
          <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide">
        {label}
          </p>
          <p className="text-base font-bold text-gray-800 mt-1">
        {value || 'Not provided'}
          </p>
        </div>
        {onCopy && (
          <div className={`p-1.5 rounded-lg ${
color === 'red' ? 'bg-red-50' : 'bg-orange-50'
        }`}>
        {copiedItem === label ? (
              <Check className={`w-4 h-4 ${
    color === 'red' ? 'text-red-600' : 'text-orange-600'
}`} />
        ) : (
              <Copy className={`w-4 h-4 ${
    color === 'red' ? 'text-red-600' : 'text-orange-600'
}`} />
        )}
          </div>
        )}
      </div>
    </div>
        );

        const InfoTile = ({ icon: Icon, label, value, color, onCopy }) => (
    <div
onClick={() => onCopy && onCopy()}
className={`p-4 bg-white rounded-2xl border border-gray-200 transition-all duration-300 hover:shadow-md ${
onCopy ? 'cursor-pointer' : ''
        }`}
        >
      <div className="flex items-center">
        <div
className="p-2.5 rounded-xl"
style={{ backgroundColor: `${color}25` }}
        >
          <Icon className="w-5 h-5" style={{ color }} />
        </div>
        <div className="ml-4 flex-1">
          <p className="text-xs font-semibold text-gray-500 uppercase tracking-wide">
        {label}
          </p>
          <p className="text-base font-bold text-gray-800 mt-1">
        {value || 'Not provided'}
          </p>
        </div>
        {onCopy && (
          <div
className="p-1.5 rounded-lg"
style={{ backgroundColor: `${color}15` }}
        >
        {copiedItem === label ? (
              <Check className="w-4 h-4" style={{ color }} />
        ) : (
              <Copy className="w-4 h-4" style={{ color }} />
        )}
          </div>
        )}
      </div>
    </div>
        );

        const SectionHeader = ({ title, icon: Icon }) => (
    <div className="flex items-center mb-3">
      <div className="p-2 bg-gradient-to-r from-red-600 to-orange-500 rounded-xl">
        <Icon className="w-5 h-5 text-white" />
      </div>
      <h2 className="ml-3 text-xl font-extrabold text-gray-800 tracking-wide">
        {title}
      </h2>
    </div>
        );

        const DeleteDialog = () => (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center p-4 z-50">
      <div className="bg-white rounded-3xl p-6 max-w-md w-full shadow-2xl">
        <div className="text-center">
          <div className="p-4 bg-red-50 rounded-full inline-block mb-4">
            <Trash2 className="w-8 h-8 text-red-600" />
          </div>
          <h3 className="text-xl font-extrabold text-gray-800 mb-2">
Delete Faculty
          </h3>
          <p className="text-gray-600 mb-6 leading-relaxed">
Are you sure you want to delete this faculty member? This action cannot be undone and all data will be permanently removed.
          </p>
          <div className="flex space-x-3">
            <button
onClick={() => setShowDeleteDialog(false)}
className="flex-1 py-4 px-6 border-2 border-gray-300 text-gray-700 font-semibold rounded-xl hover:bg-gray-50 transition-colors"
        >
Cancel
        </button>
            <button
onClick={() => {
setShowDeleteDialog(false);
alert('Delete functionality to be implemented');
              }}
className="flex-1 py-4 px-6 bg-red-600 text-white font-bold rounded-xl hover:bg-red-700 transition-colors"
        >
Delete
        </button>
          </div>
        </div>
      </div>
    </div>
        );

        return (
    <div className="min-h-screen bg-orange-50">
        {/* Header with Hero Section */}
      <div
className={`relative bg-gradient-to-b from-red-600 via-red-500 to-orange-500 transition-all duration-700 ease-out ${
animationStarted ? 'opacity-100 scale-100' : 'opacity-0 scale-95'
        }`}
style={{ height: '280px' }}
        >
        {/* Decorative circles */}
        <div className="absolute -top-12 -right-12 w-48 h-48 bg-white bg-opacity-10 rounded-full"></div>
        <div className="absolute -bottom-20 -left-20 w-40 h-40 bg-white bg-opacity-8 rounded-full"></div>

        {/* Navigation */}
        <div className="absolute top-4 left-4 z-10">
          <button className="p-2 bg-white bg-opacity-20 rounded-xl backdrop-blur-sm">
            <ArrowLeft className="w-6 h-6 text-white" />
          </button>
        </div>

        {/* Profile Content */}
        <div className="absolute bottom-10 left-0 right-0 text-center px-6">
          <div className="w-24 h-24 bg-white rounded-3xl mx-auto mb-4 flex items-center justify-center shadow-2xl">
            <User className="w-12 h-12 text-orange-500" />
          </div>
          <h1 className="text-3xl font-extrabold text-white mb-2 tracking-wide">
        {faculty.name}
          </h1>
          <div className="inline-block px-5 py-2 bg-white bg-opacity-20 backdrop-blur-sm rounded-full border border-white border-opacity-30">
            <p className="text-sm font-semibold text-white tracking-wide">
        {faculty.designation}
            </p>
          </div>
        </div>
      </div>

        {/* Content */}
      <div className="p-6 -mt-4 relative z-10">
        {/* Department Card */}
        <div className="bg-white p-5 rounded-2xl shadow-lg mb-5">
          <div className="flex items-center">
            <div className="p-3 bg-gradient-to-r from-orange-500 to-yellow-500 rounded-2xl">
              <Briefcase className="w-6 h-6 text-white" />
            </div>
            <div className="ml-4">
              <p className="text-xs font-medium text-gray-500 uppercase tracking-wide">
Department
        </p>
              <p className="text-lg font-bold text-gray-800 mt-1">
        {faculty.department}
              </p>
            </div>
          </div>
        </div>

        {/* Contact Section */}
        <SectionHeader title="Contact Details" icon={Phone} />
        <div className="space-y-3 mb-6">
          <ContactCard
icon={Mail}
label="Email"
value={faculty.email}
color="red"
onCopy={() => copyToClipboard(faculty.email, 'Email')}
        />
          <ContactCard
icon={Phone}
label="Phone"
value={faculty.contact}
color="orange"
onCopy={() => copyToClipboard(faculty.contact, 'Phone')}
        />
        </div>

        {/* Personal Information */}
        <SectionHeader title="Personal Information" icon={User} />
        <div className="space-y-3 mb-8">
          <InfoTile
icon={Calendar}
label="Date of Birth"
value={faculty.dateOfBirth}
color="#EA7300"
        />
          <InfoTile
icon={MapPin}
label="Address"
value={faculty.address}
color="#D3CA79"
onCopy={() => copyToClipboard(faculty.address, 'Address')}
        />
        </div>

        {/* Action Buttons */}
        <div className="flex space-x-4">
          <button
onClick={() => alert('Edit functionality to be implemented')}
className="flex-1 h-14 bg-gradient-to-r from-red-600 to-red-500 text-white font-bold rounded-2xl flex items-center justify-center shadow-lg hover:shadow-xl transition-all duration-300"
        >
            <Edit className="w-5 h-5 mr-2" />
Edit Profile
          </button>
          <button
onClick={() => setShowDeleteDialog(true)}
className="w-14 h-14 bg-white border-2 border-red-200 text-red-600 rounded-2xl flex items-center justify-center shadow-lg hover:shadow-xl transition-all duration-300"
        >
            <Trash2 className="w-6 h-6" />
          </button>
        </div>
      </div>

        {/* Copy Success Notification */}
        {copiedItem && (
        <div className="fixed bottom-6 left-6 right-6 bg-red-600 text-white p-4 rounded-2xl shadow-2xl flex items-center">
          <Check className="w-5 h-5 mr-3" />
          <span className="font-semibold">{copiedItem} copied successfully</span>
        </div>
        )}

        {/* Delete Dialog */}
        {showDeleteDialog && <DeleteDialog />}
    </div>
        );
        };

export default FacultyDetailsCard;