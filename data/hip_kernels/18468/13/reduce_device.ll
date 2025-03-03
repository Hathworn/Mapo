; ModuleID = '../data/hip_kernels/18468/13/main.cu'
source_filename = "../data/hip_kernels/18468/13/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ6reducePfS_mE5sdata = internal unnamed_addr addrspace(3) global [256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z6reducePfS_m(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture writeonly %1, i64 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ6reducePfS_mE5sdata, i32 0, i32 %4
  store float 0.000000e+00, float addrspace(3)* %5, align 4, !tbaa !5
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !9, !invariant.load !10
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !11
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = mul i32 %14, %10
  %16 = add i32 %15, %4
  %17 = zext i32 %16 to i64
  %18 = icmp ult i64 %17, %2
  br i1 %18, label %19, label %28

19:                                               ; preds = %3
  %20 = udiv i32 %13, %10
  %21 = mul i32 %20, %10
  %22 = icmp ugt i32 %13, %21
  %23 = zext i1 %22 to i32
  %24 = add i32 %20, %23
  %25 = mul i32 %24, %10
  %26 = zext i32 %25 to i64
  br label %30

27:                                               ; preds = %30
  store float %35, float addrspace(3)* %5, align 4, !tbaa !5
  br label %28

28:                                               ; preds = %27, %3
  %29 = icmp ult i16 %9, 2
  br i1 %29, label %38, label %40

30:                                               ; preds = %19, %30
  %31 = phi float [ 0.000000e+00, %19 ], [ %35, %30 ]
  %32 = phi i64 [ %17, %19 ], [ %36, %30 ]
  %33 = getelementptr inbounds float, float addrspace(1)* %0, i64 %32
  %34 = load float, float addrspace(1)* %33, align 4, !tbaa !5, !amdgpu.noclobber !10
  %35 = tail call float @llvm.maxnum.f32(float %34, float %31)
  %36 = add i64 %32, %26
  %37 = icmp ult i64 %36, %2
  br i1 %37, label %30, label %27, !llvm.loop !20

38:                                               ; preds = %50, %28
  %39 = icmp eq i32 %4, 0
  br i1 %39, label %52, label %56

40:                                               ; preds = %28, %50
  %41 = phi i32 [ %42, %50 ], [ %10, %28 ]
  %42 = lshr i32 %41, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %43 = icmp ult i32 %4, %42
  br i1 %43, label %44, label %50

44:                                               ; preds = %40
  %45 = add nuw nsw i32 %42, %4
  %46 = getelementptr inbounds [256 x float], [256 x float] addrspace(3)* @_ZZ6reducePfS_mE5sdata, i32 0, i32 %45
  %47 = load float, float addrspace(3)* %46, align 4, !tbaa !5
  %48 = load float, float addrspace(3)* %5, align 4, !tbaa !5
  %49 = tail call float @llvm.maxnum.f32(float %47, float %48)
  store float %49, float addrspace(3)* %5, align 4, !tbaa !5
  br label %50

50:                                               ; preds = %40, %44
  %51 = icmp ult i32 %41, 4
  br i1 %51, label %38, label %40, !llvm.loop !22

52:                                               ; preds = %38
  %53 = load float, float addrspace(3)* getelementptr inbounds ([256 x float], [256 x float] addrspace(3)* @_ZZ6reducePfS_mE5sdata, i32 0, i32 0), align 16, !tbaa !5
  %54 = zext i32 %14 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %1, i64 %54
  store float %53, float addrspace(1)* %55, align 4, !tbaa !5
  br label %56

56:                                               ; preds = %52, %38
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{i16 1, i16 1025}
!10 = !{}
!11 = !{!12, !16, i64 12}
!12 = !{!"hsa_kernel_dispatch_packet_s", !13, i64 0, !13, i64 2, !13, i64 4, !13, i64 6, !13, i64 8, !13, i64 10, !16, i64 12, !16, i64 16, !16, i64 20, !16, i64 24, !16, i64 28, !17, i64 32, !18, i64 40, !17, i64 48, !19, i64 56}
!13 = !{!"short", !14, i64 0}
!14 = !{!"omnipotent char", !15, i64 0}
!15 = !{!"Simple C/C++ TBAA"}
!16 = !{!"int", !14, i64 0}
!17 = !{!"long", !14, i64 0}
!18 = !{!"any pointer", !14, i64 0}
!19 = !{!"hsa_signal_s", !17, i64 0}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
!22 = distinct !{!22, !21}
