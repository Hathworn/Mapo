; ModuleID = '../data/hip_kernels/9000/21/main.cu'
source_filename = "../data/hip_kernels/9000/21/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x double> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11ReconstructPimP15HIP_vector_typeIdLj4EES2_S2_S2_S2_S2_S2_S2_(i32 addrspace(1)* nocapture readonly %0, i64 %1, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %2, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %3, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %4, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %5, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %6, %struct.HIP_vector_type addrspace(1)* nocapture writeonly %7, %struct.HIP_vector_type addrspace(1)* nocapture readonly %8, %struct.HIP_vector_type addrspace(1)* nocapture readonly %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = zext i16 %15 to i32
  %17 = mul i32 %11, %16
  %18 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %19 = add i32 %17, %18
  %20 = zext i32 %19 to i64
  %21 = udiv i64 %20, %1
  %22 = shl nuw i64 %21, 32
  %23 = ashr exact i64 %22, 32
  %24 = mul i64 %23, %1
  %25 = sub i64 %20, %24
  %26 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %25
  %27 = load i32, i32 addrspace(1)* %26, align 4, !tbaa !7, !amdgpu.noclobber !5
  %28 = icmp ult i64 %20, %1
  br i1 %28, label %29, label %31

29:                                               ; preds = %10
  %30 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %20
  br label %59

31:                                               ; preds = %10
  %32 = shl i64 %1, 1
  %33 = icmp ugt i64 %32, %20
  br i1 %33, label %34, label %36

34:                                               ; preds = %31
  %35 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %20
  br label %59

36:                                               ; preds = %31
  %37 = mul i64 %1, 3
  %38 = icmp ugt i64 %37, %20
  br i1 %38, label %39, label %41

39:                                               ; preds = %36
  %40 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %8, i64 %20
  br label %59

41:                                               ; preds = %36
  %42 = shl i64 %1, 2
  %43 = icmp ugt i64 %42, %20
  br i1 %43, label %44, label %47

44:                                               ; preds = %41
  %45 = sub i64 %20, %37
  %46 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %45
  br label %59

47:                                               ; preds = %41
  %48 = mul i64 %1, 5
  %49 = icmp ugt i64 %48, %20
  br i1 %49, label %50, label %53

50:                                               ; preds = %47
  %51 = sub i64 %20, %37
  %52 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %51
  br label %59

53:                                               ; preds = %47
  %54 = mul i64 %1, 6
  %55 = icmp ugt i64 %54, %20
  br i1 %55, label %56, label %66

56:                                               ; preds = %53
  %57 = sub i64 %20, %37
  %58 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %9, i64 %57
  br label %59

59:                                               ; preds = %29, %39, %50, %56, %44, %34
  %60 = phi %struct.HIP_vector_type addrspace(1)* [ %3, %34 ], [ %5, %44 ], [ %7, %56 ], [ %6, %50 ], [ %4, %39 ], [ %2, %29 ]
  %61 = phi %struct.HIP_vector_type addrspace(1)* [ %35, %34 ], [ %46, %44 ], [ %58, %56 ], [ %52, %50 ], [ %40, %39 ], [ %30, %29 ]
  %62 = sext i32 %27 to i64
  %63 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %60, i64 %62
  %64 = bitcast %struct.HIP_vector_type addrspace(1)* %63 to i8 addrspace(1)*
  %65 = bitcast %struct.HIP_vector_type addrspace(1)* %61 to i8 addrspace(1)*
  tail call void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noundef align 32 dereferenceable(32) %64, i8 addrspace(1)* noundef align 32 dereferenceable(32) %65, i64 32, i1 false)
  br label %66

66:                                               ; preds = %59, %53
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p1i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!8 = !{!"int", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
