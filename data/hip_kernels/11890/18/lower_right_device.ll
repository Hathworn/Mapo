; ModuleID = '../data/hip_kernels/11890/18/main.cu'
source_filename = "../data/hip_kernels/11890/18/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z11lower_rightPiS_S_iiii(i32 addrspace(1)* nocapture writeonly %0, i32 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, i32 %5, i32 %6) local_unnamed_addr #0 {
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 2, !range !4, !invariant.load !5
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %16 = add i32 %15, %5
  %17 = add i32 %16, %14
  %18 = add i32 %17, 1
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %21 = bitcast i8 addrspace(4)* %20 to i16 addrspace(4)*
  %22 = load i16, i16 addrspace(4)* %21, align 4, !range !4, !invariant.load !5
  %23 = zext i16 %22 to i32
  %24 = mul i32 %19, %23
  %25 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %26 = add i32 %25, %5
  %27 = add i32 %26, %24
  %28 = add i32 %27, 1
  %29 = icmp slt i32 %18, %3
  %30 = icmp slt i32 %28, %4
  %31 = select i1 %29, i1 %30, i1 false
  br i1 %31, label %32, label %62

32:                                               ; preds = %7
  %33 = xor i32 %27, -1
  %34 = add i32 %5, %4
  %35 = add i32 %34, %33
  %36 = icmp eq i32 %18, %35
  br i1 %36, label %37, label %62

37:                                               ; preds = %32
  %38 = mul nsw i32 %17, %4
  %39 = add nsw i32 %28, %38
  %40 = add i32 %38, %27
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %41
  %43 = load i32, i32 addrspace(1)* %42, align 4, !tbaa !7, !amdgpu.noclobber !5
  %44 = mul nsw i32 %18, %4
  %45 = add nsw i32 %44, %28
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %46
  %48 = load i32, i32 addrspace(1)* %47, align 4, !tbaa !7, !amdgpu.noclobber !5
  %49 = add nsw i32 %48, %43
  %50 = add i32 %44, %27
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %51
  %53 = load i32, i32 addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !5
  %54 = sub nsw i32 %53, %6
  %55 = sext i32 %39 to i64
  %56 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %55
  %57 = load i32, i32 addrspace(1)* %56, align 4, !tbaa !7, !amdgpu.noclobber !5
  %58 = sub nsw i32 %57, %6
  %59 = tail call i32 @llvm.smax.i32(i32 %49, i32 %54)
  %60 = tail call i32 @llvm.smax.i32(i32 %59, i32 %58)
  %61 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %46
  store i32 %60, i32 addrspace(1)* %61, align 4, !tbaa !7
  br label %62

62:                                               ; preds = %32, %37, %7
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

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
