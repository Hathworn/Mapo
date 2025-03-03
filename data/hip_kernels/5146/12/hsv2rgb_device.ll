; ModuleID = '../data/hip_kernels/5146/12/main.cu'
source_filename = "../data/hip_kernels/5146/12/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { %"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" }
%"struct.HIP_vector_base<unsigned char, 3>::Native_vec_" = type { [3 x i8] }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z7hsv2rgbPfS_S_P15HIP_vector_typeIhLj3EEii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = icmp slt i32 %15, %4
  %25 = icmp slt i32 %23, %5
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %152

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %4
  %29 = add nsw i32 %28, %15
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %0, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = getelementptr inbounds float, float addrspace(1)* %1, i64 %30
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !7, !amdgpu.noclobber !6
  %35 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = fdiv contract float %32, 6.000000e+01
  %38 = fptosi float %37 to i32
  %39 = srem i32 %38, 6
  %40 = sitofp i32 %39 to float
  %41 = fsub contract float %37, %40
  %42 = fsub contract float 1.000000e+00, %34
  %43 = fmul contract float %36, %42
  %44 = fmul contract float %34, %41
  %45 = fsub contract float 1.000000e+00, %44
  %46 = fmul contract float %36, %45
  %47 = fsub contract float 1.000000e+00, %41
  %48 = fmul contract float %34, %47
  %49 = fsub contract float 1.000000e+00, %48
  %50 = fmul contract float %36, %49
  %51 = fcmp contract oge float %32, 0.000000e+00
  %52 = fcmp contract olt float %32, 6.000000e+01
  %53 = and i1 %51, %52
  br i1 %53, label %54, label %67

54:                                               ; preds = %27
  %55 = fmul contract float %36, 2.550000e+02
  %56 = fptosi float %55 to i32
  %57 = trunc i32 %56 to i8
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  store i8 %57, i8 addrspace(1)* %58, align 1, !tbaa !11
  %59 = fmul contract float %50, 2.550000e+02
  %60 = fptosi float %59 to i32
  %61 = trunc i32 %60 to i8
  %62 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  store i8 %61, i8 addrspace(1)* %62, align 1, !tbaa !11
  %63 = fmul contract float %43, 2.550000e+02
  %64 = fptosi float %63 to i32
  %65 = trunc i32 %64 to i8
  %66 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  store i8 %65, i8 addrspace(1)* %66, align 1, !tbaa !11
  br label %67

67:                                               ; preds = %54, %27
  %68 = fcmp contract oge float %32, 6.000000e+01
  %69 = fcmp contract olt float %32, 1.200000e+02
  %70 = and i1 %68, %69
  br i1 %70, label %71, label %84

71:                                               ; preds = %67
  %72 = fmul contract float %46, 2.550000e+02
  %73 = fptosi float %72 to i32
  %74 = trunc i32 %73 to i8
  %75 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  store i8 %74, i8 addrspace(1)* %75, align 1, !tbaa !11
  %76 = fmul contract float %36, 2.550000e+02
  %77 = fptosi float %76 to i32
  %78 = trunc i32 %77 to i8
  %79 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  store i8 %78, i8 addrspace(1)* %79, align 1, !tbaa !11
  %80 = fmul contract float %43, 2.550000e+02
  %81 = fptosi float %80 to i32
  %82 = trunc i32 %81 to i8
  %83 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  store i8 %82, i8 addrspace(1)* %83, align 1, !tbaa !11
  br label %84

84:                                               ; preds = %71, %67
  %85 = fcmp contract oge float %32, 1.200000e+02
  %86 = fcmp contract olt float %32, 1.800000e+02
  %87 = and i1 %85, %86
  br i1 %87, label %88, label %101

88:                                               ; preds = %84
  %89 = fmul contract float %43, 2.550000e+02
  %90 = fptosi float %89 to i32
  %91 = trunc i32 %90 to i8
  %92 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  store i8 %91, i8 addrspace(1)* %92, align 1, !tbaa !11
  %93 = fmul contract float %36, 2.550000e+02
  %94 = fptosi float %93 to i32
  %95 = trunc i32 %94 to i8
  %96 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  store i8 %95, i8 addrspace(1)* %96, align 1, !tbaa !11
  %97 = fmul contract float %50, 2.550000e+02
  %98 = fptosi float %97 to i32
  %99 = trunc i32 %98 to i8
  %100 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  store i8 %99, i8 addrspace(1)* %100, align 1, !tbaa !11
  br label %101

101:                                              ; preds = %88, %84
  %102 = fcmp contract oge float %32, 1.800000e+02
  %103 = fcmp contract olt float %32, 2.400000e+02
  %104 = and i1 %102, %103
  br i1 %104, label %105, label %118

105:                                              ; preds = %101
  %106 = fmul contract float %43, 2.550000e+02
  %107 = fptosi float %106 to i32
  %108 = trunc i32 %107 to i8
  %109 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  store i8 %108, i8 addrspace(1)* %109, align 1, !tbaa !11
  %110 = fmul contract float %46, 2.550000e+02
  %111 = fptosi float %110 to i32
  %112 = trunc i32 %111 to i8
  %113 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  store i8 %112, i8 addrspace(1)* %113, align 1, !tbaa !11
  %114 = fmul contract float %36, 2.550000e+02
  %115 = fptosi float %114 to i32
  %116 = trunc i32 %115 to i8
  %117 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  store i8 %116, i8 addrspace(1)* %117, align 1, !tbaa !11
  br label %118

118:                                              ; preds = %105, %101
  %119 = fcmp contract oge float %32, 2.400000e+02
  %120 = fcmp contract olt float %32, 3.000000e+02
  %121 = and i1 %119, %120
  br i1 %121, label %122, label %135

122:                                              ; preds = %118
  %123 = fmul contract float %50, 2.550000e+02
  %124 = fptosi float %123 to i32
  %125 = trunc i32 %124 to i8
  %126 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  store i8 %125, i8 addrspace(1)* %126, align 1, !tbaa !11
  %127 = fmul contract float %43, 2.550000e+02
  %128 = fptosi float %127 to i32
  %129 = trunc i32 %128 to i8
  %130 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  store i8 %129, i8 addrspace(1)* %130, align 1, !tbaa !11
  %131 = fmul contract float %36, 2.550000e+02
  %132 = fptosi float %131 to i32
  %133 = trunc i32 %132 to i8
  %134 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  store i8 %133, i8 addrspace(1)* %134, align 1, !tbaa !11
  br label %135

135:                                              ; preds = %122, %118
  %136 = fcmp contract oge float %32, 3.000000e+02
  %137 = fcmp contract olt float %32, 3.600000e+02
  %138 = and i1 %136, %137
  br i1 %138, label %139, label %152

139:                                              ; preds = %135
  %140 = fmul contract float %36, 2.550000e+02
  %141 = fptosi float %140 to i32
  %142 = trunc i32 %141 to i8
  %143 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 0
  store i8 %142, i8 addrspace(1)* %143, align 1, !tbaa !11
  %144 = fmul contract float %43, 2.550000e+02
  %145 = fptosi float %144 to i32
  %146 = trunc i32 %145 to i8
  %147 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 1
  store i8 %146, i8 addrspace(1)* %147, align 1, !tbaa !11
  %148 = fmul contract float %46, 2.550000e+02
  %149 = fptosi float %148 to i32
  %150 = trunc i32 %149 to i8
  %151 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %30, i32 0, i32 0, i32 0, i32 0, i64 2
  store i8 %150, i8 addrspace(1)* %151, align 1, !tbaa !11
  br label %152

152:                                              ; preds = %135, %139, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
