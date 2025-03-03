; ModuleID = '../data/hip_kernels/9310/24/main.cu'
source_filename = "../data/hip_kernels/9310/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

$_ZL14kernelFindMax4PKiiPi = comdat any

@cache = external hidden local_unnamed_addr addrspace(3) global [0 x i32], align 4

; Function Attrs: convergent mustprogress norecurse nounwind
define amdgpu_kernel void @_ZL14kernelFindMax4PKiiPi(i32 addrspace(1)* nocapture readonly %0, i32 %1, i32 addrspace(1)* nocapture %2) local_unnamed_addr #0 comdat {
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = getelementptr inbounds i8, i8 addrspace(4)* %5, i64 12
  %11 = bitcast i8 addrspace(4)* %10 to i32 addrspace(4)*
  %12 = load i32, i32 addrspace(4)* %11, align 4, !tbaa !7
  %13 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %14 = mul i32 %13, %9
  %15 = add i32 %14, %4
  %16 = udiv i32 %12, %9
  %17 = mul i32 %16, %9
  %18 = icmp ugt i32 %12, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %9
  %22 = add i32 %21, %15
  %23 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @cache, i32 0, i32 %4
  store i32 -2147483648, i32 addrspace(3)* %23, align 4, !tbaa !16
  %24 = icmp slt i32 %15, %1
  br i1 %24, label %25, label %29

25:                                               ; preds = %3
  %26 = sext i32 %15 to i64
  %27 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %26
  %28 = load i32, i32 addrspace(1)* %27, align 4, !tbaa !16, !amdgpu.noclobber !6
  store i32 %28, i32 addrspace(3)* %23, align 4, !tbaa !16
  br label %29

29:                                               ; preds = %25, %3
  %30 = phi i32 [ %28, %25 ], [ -2147483648, %3 ]
  %31 = icmp slt i32 %22, %1
  br i1 %31, label %32, label %37

32:                                               ; preds = %29
  %33 = sext i32 %22 to i64
  %34 = getelementptr inbounds i32, i32 addrspace(1)* %0, i64 %33
  %35 = load i32, i32 addrspace(1)* %34, align 4, !tbaa !16, !amdgpu.noclobber !6
  %36 = tail call i32 @llvm.smax.i32(i32 %30, i32 %35)
  store i32 %36, i32 addrspace(3)* %23, align 4, !tbaa !16
  br label %37

37:                                               ; preds = %32, %29
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %38 = icmp ugt i16 %8, 1
  br i1 %38, label %41, label %39

39:                                               ; preds = %51, %37
  %40 = icmp eq i32 %4, 0
  br i1 %40, label %53, label %56

41:                                               ; preds = %37, %51
  %42 = phi i32 [ %43, %51 ], [ %9, %37 ]
  %43 = lshr i32 %42, 1
  %44 = icmp ult i32 %4, %43
  br i1 %44, label %45, label %51

45:                                               ; preds = %41
  %46 = load i32, i32 addrspace(3)* %23, align 4, !tbaa !16
  %47 = xor i32 %43, %4
  %48 = getelementptr inbounds [0 x i32], [0 x i32] addrspace(3)* @cache, i32 0, i32 %47
  %49 = load i32, i32 addrspace(3)* %48, align 4, !tbaa !16
  %50 = tail call i32 @llvm.smax.i32(i32 %46, i32 %49)
  store i32 %50, i32 addrspace(3)* %23, align 4, !tbaa !16
  br label %51

51:                                               ; preds = %45, %41
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %52 = icmp ugt i32 %42, 3
  br i1 %52, label %41, label %39, !llvm.loop !20

53:                                               ; preds = %39
  %54 = load i32, i32 addrspace(3)* getelementptr inbounds ([0 x i32], [0 x i32] addrspace(3)* @cache, i32 0, i32 0), align 4, !tbaa !16
  %55 = atomicrmw max i32 addrspace(1)* %2, i32 %54 syncscope("agent-one-as") monotonic, align 4
  br label %56

56:                                               ; preds = %53, %39
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !12, i64 12}
!8 = !{!"hsa_kernel_dispatch_packet_s", !9, i64 0, !9, i64 2, !9, i64 4, !9, i64 6, !9, i64 8, !9, i64 10, !12, i64 12, !12, i64 16, !12, i64 20, !12, i64 24, !12, i64 28, !13, i64 32, !14, i64 40, !13, i64 48, !15, i64 56}
!9 = !{!"short", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C/C++ TBAA"}
!12 = !{!"int", !10, i64 0}
!13 = !{!"long", !10, i64 0}
!14 = !{!"any pointer", !10, i64 0}
!15 = !{!"hsa_signal_s", !13, i64 0}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.mustprogress"}
