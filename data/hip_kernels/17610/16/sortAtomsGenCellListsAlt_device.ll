; ModuleID = '../data/hip_kernels/17610/16/main.cu'
source_filename = "../data/hip_kernels/17610/16/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x float> }
%struct.HIP_vector_type.0 = type { %struct.HIP_vector_base.1 }
%struct.HIP_vector_base.1 = type { %union.anon.2 }
%union.anon.2 = type { <2 x i32> }

@hash_s = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind willreturn
define protected amdgpu_kernel void @_Z24sortAtomsGenCellListsAltjPK15HIP_vector_typeIfLj4EES2_PKjPjS4_PS0_S6_PS_IjLj2EE(i32 %0, %struct.HIP_vector_type addrspace(1)* nocapture readonly %1, %struct.HIP_vector_type addrspace(1)* readonly %2, i32 addrspace(1)* nocapture readonly %3, i32 addrspace(1)* nocapture writeonly %4, i32 addrspace(1)* nocapture readonly %5, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %6, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %7, %struct.HIP_vector_type.0 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %12 = getelementptr i8, i8 addrspace(4)* %11, i64 4
  %13 = bitcast i8 addrspace(4)* %12 to i16 addrspace(4)*
  %14 = load i16, i16 addrspace(4)* %13, align 4, !range !4, !invariant.load !5
  %15 = zext i16 %14 to i32
  %16 = mul i32 %10, %15
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %18 = add i32 %16, %17
  %19 = icmp ult i32 %18, %0
  br i1 %19, label %20, label %34

20:                                               ; preds = %9
  %21 = zext i32 %18 to i64
  %22 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %21
  %23 = load i32, i32 addrspace(1)* %22, align 4, !tbaa !7, !amdgpu.noclobber !5
  %24 = add nuw nsw i32 %17, 1
  %25 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hash_s, i32 0, i32 %24
  store i32 %23, i32 addrspace(3)* %25, align 4, !tbaa !7
  %26 = icmp ne i32 %18, 0
  %27 = icmp eq i32 %17, 0
  %28 = and i1 %27, %26
  br i1 %28, label %29, label %34

29:                                               ; preds = %20
  %30 = add i32 %18, -1
  %31 = zext i32 %30 to i64
  %32 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %31
  %33 = load i32, i32 addrspace(1)* %32, align 4, !tbaa !7, !amdgpu.noclobber !5
  store i32 %33, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @hash_s, i32 0, i32 0), align 4, !tbaa !7
  br label %34

34:                                               ; preds = %20, %29, %9
  %35 = phi i32 [ %23, %29 ], [ %23, %20 ], [ undef, %9 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %19, label %36, label %71

36:                                               ; preds = %34
  %37 = icmp eq i32 %18, 0
  br i1 %37, label %47, label %38

38:                                               ; preds = %36
  %39 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @hash_s, i32 0, i32 %17
  %40 = load i32, i32 addrspace(3)* %39, align 4, !tbaa !7
  %41 = icmp eq i32 %35, %40
  br i1 %41, label %50, label %42

42:                                               ; preds = %38
  %43 = zext i32 %35 to i64
  %44 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %8, i64 %43, i32 0, i32 0, i32 0, i64 0
  store i32 %18, i32 addrspace(1)* %44, align 8, !tbaa !11
  %45 = zext i32 %40 to i64
  %46 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %8, i64 %45, i32 0, i32 0, i32 0, i64 1
  store i32 %18, i32 addrspace(1)* %46, align 4, !tbaa !11
  br label %50

47:                                               ; preds = %36
  %48 = zext i32 %35 to i64
  %49 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %8, i64 %48, i32 0, i32 0, i32 0, i64 0
  store i32 0, i32 addrspace(1)* %49, align 8, !tbaa !11
  br label %50

50:                                               ; preds = %47, %42, %38
  %51 = add i32 %0, -1
  %52 = icmp eq i32 %18, %51
  br i1 %52, label %53, label %57

53:                                               ; preds = %50
  %54 = add nuw i32 %18, 1
  %55 = zext i32 %35 to i64
  %56 = getelementptr inbounds %struct.HIP_vector_type.0, %struct.HIP_vector_type.0 addrspace(1)* %8, i64 %55, i32 0, i32 0, i32 0, i64 1
  store i32 %54, i32 addrspace(1)* %56, align 4, !tbaa !11
  br label %57

57:                                               ; preds = %53, %50
  %58 = zext i32 %18 to i64
  %59 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %58
  %60 = load i32, i32 addrspace(1)* %59, align 4, !tbaa !7
  %61 = zext i32 %60 to i64
  %62 = getelementptr inbounds i32, i32 addrspace(1)* %4, i64 %61
  store i32 %18, i32 addrspace(1)* %62, align 4, !tbaa !7
  %63 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %1, i64 %61, i32 0, i32 0, i32 0
  %64 = load <4 x float>, <4 x float> addrspace(1)* %63, align 16
  %65 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %6, i64 %58, i32 0, i32 0, i32 0
  store <4 x float> %64, <4 x float> addrspace(1)* %65, align 16
  %66 = icmp eq %struct.HIP_vector_type addrspace(1)* %2, addrspacecast (%struct.HIP_vector_type* null to %struct.HIP_vector_type addrspace(1)*)
  br i1 %66, label %71, label %67

67:                                               ; preds = %57
  %68 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %2, i64 %61, i32 0, i32 0, i32 0
  %69 = load <4 x float>, <4 x float> addrspace(1)* %68, align 16
  %70 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %7, i64 %58, i32 0, i32 0, i32 0
  store <4 x float> %69, <4 x float> addrspace(1)* %70, align 16
  br label %71

71:                                               ; preds = %57, %67, %34
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { convergent mustprogress norecurse nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
