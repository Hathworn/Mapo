; ModuleID = '../data/hip_kernels/9664/24/main.cu'
source_filename = "../data/hip_kernels/9664/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x double> }

@shaccelerations = external hidden local_unnamed_addr addrspace(3) global [0 x %struct.HIP_vector_type], align 32

; Function Attrs: mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6reduceP15HIP_vector_typeIdLj4EES1_S1_jj(%struct.HIP_vector_type addrspace(1)* nocapture %0, %struct.HIP_vector_type addrspace(1)* nocapture %1, %struct.HIP_vector_type addrspace(1)* nocapture %2, i32 %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %9 = bitcast i8 addrspace(4)* %8 to i16 addrspace(4)*
  %10 = load i16, i16 addrspace(4)* %9, align 4, !range !4, !invariant.load !5
  %11 = zext i16 %10 to i32
  %12 = mul i32 %6, %11
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %14 = add i32 %12, %13
  %15 = mul i32 %4, %3
  %16 = icmp ult i32 %14, %15
  br i1 %16, label %17, label %23

17:                                               ; preds = %5
  %18 = zext i32 %14 to i64
  %19 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 0
  %20 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 1
  %21 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %0, i64 %18, i32 0, i32 0, i32 0, i64 2
  %22 = add i32 %14, %15
  br label %39

23:                                               ; preds = %5
  %24 = shl i32 %15, 1
  %25 = icmp ult i32 %14, %24
  br i1 %25, label %26, label %32

26:                                               ; preds = %23
  %27 = sub i32 %14, %15
  %28 = zext i32 %27 to i64
  %29 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i64 0
  %30 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i64 1
  %31 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %28, i32 0, i32 0, i32 0, i64 2
  br label %39

32:                                               ; preds = %23
  %33 = sub i32 %14, %24
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %34, i32 0, i32 0, i32 0, i64 0
  %36 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %34, i32 0, i32 0, i32 0, i64 1
  %37 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %34, i32 0, i32 0, i32 0, i64 2
  %38 = sub i32 %14, %15
  br label %39

39:                                               ; preds = %26, %32, %17
  %40 = phi i32 [ %14, %26 ], [ %38, %32 ], [ %22, %17 ]
  %41 = phi %struct.HIP_vector_type addrspace(1)* [ %1, %26 ], [ %2, %32 ], [ %0, %17 ]
  %42 = phi double addrspace(1)* [ %29, %26 ], [ %35, %32 ], [ %19, %17 ]
  %43 = phi double addrspace(1)* [ %30, %26 ], [ %36, %32 ], [ %20, %17 ]
  %44 = phi double addrspace(1)* [ %31, %26 ], [ %37, %32 ], [ %21, %17 ]
  %45 = load double, double addrspace(1)* %44, align 16
  %46 = load double, double addrspace(1)* %43, align 8
  %47 = load double, double addrspace(1)* %42, align 32
  %48 = zext i32 %40 to i64
  %49 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %41, i64 %48
  %50 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @shaccelerations, i32 0, i32 %13
  %51 = bitcast %struct.HIP_vector_type addrspace(3)* %50 to i8 addrspace(3)*
  %52 = bitcast %struct.HIP_vector_type addrspace(1)* %49 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noundef align 32 dereferenceable(32) %51, i8 addrspace(1)* noundef align 32 dereferenceable(32) %52, i64 32, i1 false)
  %53 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @shaccelerations, i32 0, i32 %13, i32 0, i32 0, i32 0, i32 0
  %54 = load double, double addrspace(3)* %53, align 32, !tbaa !7
  %55 = fadd contract double %47, %54
  %56 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @shaccelerations, i32 0, i32 %13, i32 0, i32 0, i32 0, i32 1
  %57 = load double, double addrspace(3)* %56, align 8, !tbaa !7
  %58 = fadd contract double %46, %57
  %59 = getelementptr inbounds [0 x %struct.HIP_vector_type], [0 x %struct.HIP_vector_type] addrspace(3)* @shaccelerations, i32 0, i32 %13, i32 0, i32 0, i32 0, i32 2
  %60 = load double, double addrspace(3)* %59, align 16, !tbaa !7
  %61 = fadd contract double %45, %60
  store double %55, double addrspace(1)* %42, align 32
  store double %58, double addrspace(1)* %43, align 8
  store double %61, double addrspace(1)* %44, align 16
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p3i8.p1i8.i64(i8 addrspace(3)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { argmemonly nocallback nofree nounwind willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
