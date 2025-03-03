; ModuleID = '../data/hip_kernels/7024/0/main.cu'
source_filename = "../data/hip_kernels/7024/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z20cudaComputeXGradientPiPhii(i32 addrspace(1)* nocapture writeonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %53, label %15

15:                                               ; preds = %4
  %16 = add nsw i32 %13, -1
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %17
  %19 = load i8, i8 addrspace(1)* %18, align 1, !tbaa !7, !amdgpu.noclobber !5
  %20 = zext i8 %19 to i32
  %21 = sext i32 %13 to i64
  %22 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %21
  %23 = load i8, i8 addrspace(1)* %22, align 1, !tbaa !7, !amdgpu.noclobber !5
  %24 = zext i8 %23 to i32
  %25 = add nsw i32 %13, 1
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %26
  %28 = load i8, i8 addrspace(1)* %27, align 1, !tbaa !7, !amdgpu.noclobber !5
  %29 = zext i8 %28 to i32
  %30 = shl nsw i32 %2, 1
  %31 = add nsw i32 %13, %30
  %32 = add nsw i32 %31, -1
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %33
  %35 = load i8, i8 addrspace(1)* %34, align 1, !tbaa !7, !amdgpu.noclobber !5
  %36 = zext i8 %35 to i32
  %37 = sext i32 %31 to i64
  %38 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %37
  %39 = load i8, i8 addrspace(1)* %38, align 1, !tbaa !7, !amdgpu.noclobber !5
  %40 = zext i8 %39 to i32
  %41 = add nsw i32 %31, 1
  %42 = sext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7, !amdgpu.noclobber !5
  %45 = zext i8 %44 to i32
  %46 = sub nsw i32 %24, %40
  %47 = shl nsw i32 %46, 1
  %48 = add nuw nsw i32 %29, %20
  %49 = add nuw nsw i32 %36, %45
  %50 = sub nsw i32 %48, %49
  %51 = add nsw i32 %50, %47
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %21
  store i32 %51, i32 addrspace(1)* %52, align 4, !tbaa !10
  br label %53

53:                                               ; preds = %4, %15
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

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
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
