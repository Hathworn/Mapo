; ModuleID = '../data/hip_kernels/3265/69/main.cu'
source_filename = "../data/hip_kernels/3265/69/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ10smemKerneliPdS_E4buff = internal unnamed_addr addrspace(3) global [16 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10smemKerneliPdS_(i32 %0, double addrspace(1)* nocapture readonly %1, double addrspace(1)* nocapture %2) local_unnamed_addr #0 {
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = mul i32 %9, %8
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add nsw i32 %10, %11
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %16, label %14

14:                                               ; preds = %3
  %15 = sext i32 %12 to i64
  br label %21

16:                                               ; preds = %3
  %17 = add nuw nsw i32 %0, 15
  %18 = lshr i32 %17, 4
  %19 = sext i32 %12 to i64
  %20 = getelementptr inbounds double, double addrspace(1)* %2, i64 %19
  br label %27

21:                                               ; preds = %48, %14
  %22 = phi i64 [ %15, %14 ], [ %19, %48 ]
  %23 = sitofp i32 %0 to double
  %24 = getelementptr inbounds double, double addrspace(1)* %2, i64 %22
  %25 = load double, double addrspace(1)* %24, align 8, !tbaa !7
  %26 = fdiv contract double %25, %23
  store double %26, double addrspace(1)* %24, align 8, !tbaa !7
  ret void

27:                                               ; preds = %16, %48
  %28 = phi i32 [ 0, %16 ], [ %49, %48 ]
  %29 = shl nsw i32 %28, 4
  %30 = add nuw nsw i32 %29, 16
  %31 = tail call i32 @llvm.smin.i32(i32 %30, i32 %0)
  %32 = add nuw nsw i32 %29, %11
  %33 = icmp slt i32 %32, %31
  br i1 %33, label %38, label %34

34:                                               ; preds = %38, %27
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %35 = icmp slt i32 %29, %31
  br i1 %35, label %36, label %48

36:                                               ; preds = %34
  %37 = load double, double addrspace(1)* %20, align 8, !tbaa !7
  br label %51

38:                                               ; preds = %27, %38
  %39 = phi i32 [ %45, %38 ], [ %32, %27 ]
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds double, double addrspace(1)* %1, i64 %40
  %42 = load double, double addrspace(1)* %41, align 8, !tbaa !7
  %43 = sub nuw nsw i32 %39, %29
  %44 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZ10smemKerneliPdS_E4buff, i32 0, i32 %43
  store double %42, double addrspace(3)* %44, align 8, !tbaa !7
  %45 = add nuw nsw i32 %39, %8
  %46 = icmp slt i32 %45, %31
  br i1 %46, label %38, label %34, !llvm.loop !11

47:                                               ; preds = %51
  store double %57, double addrspace(1)* %20, align 8, !tbaa !7
  br label %48

48:                                               ; preds = %47, %34
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %49 = add nuw nsw i32 %28, 1
  %50 = icmp eq i32 %49, %18
  br i1 %50, label %21, label %27, !llvm.loop !13

51:                                               ; preds = %36, %51
  %52 = phi double [ %37, %36 ], [ %57, %51 ]
  %53 = phi i32 [ %29, %36 ], [ %58, %51 ]
  %54 = sub nuw nsw i32 %53, %29
  %55 = getelementptr inbounds [16 x double], [16 x double] addrspace(3)* @_ZZ10smemKerneliPdS_E4buff, i32 0, i32 %54
  %56 = load double, double addrspace(3)* %55, align 8, !tbaa !7
  %57 = fadd contract double %56, %52
  %58 = add nuw nsw i32 %53, 1
  %59 = icmp slt i32 %58, %31
  br i1 %59, label %51, label %47, !llvm.loop !14
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smin.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

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
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
