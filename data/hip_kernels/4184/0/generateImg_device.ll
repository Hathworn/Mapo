; ModuleID = '../data/hip_kernels/4184/0/main.cu'
source_filename = "../data/hip_kernels/4184/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <4 x i32> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11generateImgPhS_S_P15HIP_vector_typeIiLj4EEii(i8 addrspace(1)* nocapture %0, i8 addrspace(1)* nocapture writeonly %1, i8 addrspace(1)* nocapture readonly %2, %struct.HIP_vector_type addrspace(1)* nocapture readonly %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = mul i32 %7, %12
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %15 = add i32 %13, %14
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %17 = getelementptr i8, i8 addrspace(4)* %8, i64 6
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 2, !range !4, !invariant.load !5
  %20 = zext i16 %19 to i32
  %21 = mul i32 %16, %20
  %22 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %23 = add i32 %21, %22
  %24 = mul nsw i32 %23, %5
  %25 = add nsw i32 %15, %24
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !7, !amdgpu.noclobber !5
  %29 = icmp eq i8 %28, 0
  br i1 %29, label %30, label %79

30:                                               ; preds = %6
  %31 = getelementptr inbounds i8, i8 addrspace(1)* %2, i64 %26
  %32 = load i8, i8 addrspace(1)* %31, align 1, !tbaa !7, !amdgpu.noclobber !5
  %33 = zext i8 %32 to i32
  %34 = icmp eq i32 %33, %4
  %35 = icmp ne i32 %4, 1
  %36 = and i1 %35, %34
  br i1 %36, label %37, label %79

37:                                               ; preds = %30
  %38 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %26, i32 0, i32 0, i32 0, i64 0
  %39 = load i32, i32 addrspace(1)* %38, align 16, !tbaa !7, !amdgpu.noclobber !5
  %40 = icmp ne i32 %39, -1
  %41 = zext i1 %40 to i16
  %42 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %26, i32 0, i32 0, i32 0, i64 1
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = icmp eq i32 %43, -1
  %45 = select i1 %40, i16 2, i16 1
  %46 = select i1 %44, i16 %41, i16 %45
  %47 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %26, i32 0, i32 0, i32 0, i64 2
  %48 = load i32, i32 addrspace(1)* %47, align 8, !tbaa !7, !amdgpu.noclobber !5
  %49 = icmp ne i32 %48, -1
  %50 = zext i1 %49 to i16
  %51 = add nuw nsw i16 %46, %50
  %52 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %3, i64 %26, i32 0, i32 0, i32 0, i64 3
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = icmp ne i32 %53, -1
  %55 = zext i1 %54 to i16
  %56 = add nuw nsw i16 %51, %55
  %57 = sext i32 %39 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !7, !amdgpu.noclobber !5
  %60 = zext i8 %59 to i16
  %61 = sext i32 %43 to i64
  %62 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %61
  %63 = load i8, i8 addrspace(1)* %62, align 1, !tbaa !7, !amdgpu.noclobber !5
  %64 = zext i8 %63 to i16
  %65 = add nuw nsw i16 %64, %60
  %66 = sext i32 %48 to i64
  %67 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %66
  %68 = load i8, i8 addrspace(1)* %67, align 1, !tbaa !7, !amdgpu.noclobber !5
  %69 = zext i8 %68 to i16
  %70 = add nuw nsw i16 %65, %69
  %71 = sext i32 %53 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %71
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !7, !amdgpu.noclobber !5
  %74 = zext i8 %73 to i16
  %75 = add nuw nsw i16 %70, %74
  %76 = udiv i16 %75, %56
  %77 = trunc i16 %76 to i8
  store i8 %77, i8 addrspace(1)* %27, align 1, !tbaa !7
  %78 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %26
  store i8 %77, i8 addrspace(1)* %78, align 1, !tbaa !7
  br label %79

79:                                               ; preds = %37, %30, %6
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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
