; ModuleID = '../data/hip_kernels/13913/51/main.cu'
source_filename = "../data/hip_kernels/13913/51/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11__transposePdiS_iiiE4tile = internal unnamed_addr addrspace(3) global [32 x [33 x double]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11__transposePdiS_iii(double addrspace(1)* nocapture readonly %0, i32 %1, double addrspace(1)* nocapture writeonly %2, i32 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %8 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 12
  %9 = bitcast i8 addrspace(4)* %8 to i32 addrspace(4)*
  %10 = load i32, i32 addrspace(4)* %9, align 4, !tbaa !4
  %11 = getelementptr i8, i8 addrspace(4)* %7, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !13, !invariant.load !14
  %14 = zext i16 %13 to i32
  %15 = udiv i32 %10, %14
  %16 = mul i32 %15, %14
  %17 = icmp ugt i32 %10, %16
  %18 = zext i1 %17 to i32
  %19 = add i32 %15, %18
  %20 = shl i32 %19, 5
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %7, i64 16
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 8, !tbaa !15
  %24 = getelementptr i8, i8 addrspace(4)* %7, i64 6
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 2, !range !13, !invariant.load !14
  %27 = zext i16 %26 to i32
  %28 = udiv i32 %23, %27
  %29 = mul i32 %28, %27
  %30 = icmp ugt i32 %23, %29
  %31 = zext i1 %30 to i32
  %32 = add i32 %28, %31
  %33 = shl i32 %32, 5
  %34 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %35 = shl i32 %34, 5
  %36 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %37 = shl i32 %36, 5
  %38 = icmp slt i32 %37, %5
  br i1 %38, label %39, label %52

39:                                               ; preds = %6
  %40 = icmp slt i32 %35, %4
  %41 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %42 = tail call i32 @llvm.amdgcn.workitem.id.y()
  br label %43

43:                                               ; preds = %39, %53
  %44 = phi i32 [ %37, %39 ], [ %54, %53 ]
  br i1 %40, label %45, label %53

45:                                               ; preds = %43
  %46 = add nsw i32 %44, 32
  %47 = tail call i32 @llvm.smin.i32(i32 %5, i32 %46)
  %48 = add i32 %44, %42
  %49 = icmp sge i32 %48, %47
  %50 = add i32 %44, %41
  %51 = icmp ult i32 %50, %5
  br label %56

52:                                               ; preds = %53, %6
  ret void

53:                                               ; preds = %89, %43
  %54 = add nsw i32 %44, %33
  %55 = icmp slt i32 %54, %5
  br i1 %55, label %43, label %52, !llvm.loop !16

56:                                               ; preds = %45, %89
  %57 = phi i32 [ %35, %45 ], [ %90, %89 ]
  %58 = add i32 %57, %41
  %59 = icmp uge i32 %58, %4
  %60 = select i1 %59, i1 true, i1 %49
  br i1 %60, label %72, label %61

61:                                               ; preds = %56, %61
  %62 = phi i32 [ %70, %61 ], [ %48, %56 ]
  %63 = mul nsw i32 %62, %1
  %64 = add i32 %63, %58
  %65 = zext i32 %64 to i64
  %66 = getelementptr inbounds double, double addrspace(1)* %0, i64 %65
  %67 = load double, double addrspace(1)* %66, align 8, !tbaa !18
  %68 = sub nsw i32 %62, %44
  %69 = getelementptr inbounds [32 x [33 x double]], [32 x [33 x double]] addrspace(3)* @_ZZ11__transposePdiS_iiiE4tile, i32 0, i32 %41, i32 %68
  store double %67, double addrspace(3)* %69, align 8, !tbaa !18
  %70 = add i32 %62, %27
  %71 = icmp slt i32 %70, %47
  br i1 %71, label %61, label %72, !llvm.loop !22

72:                                               ; preds = %61, %56
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %51, label %73, label %89

73:                                               ; preds = %72
  %74 = add nsw i32 %57, 32
  %75 = tail call i32 @llvm.smin.i32(i32 %4, i32 %74)
  %76 = add i32 %57, %42
  %77 = icmp slt i32 %76, %75
  br i1 %77, label %78, label %89

78:                                               ; preds = %73, %78
  %79 = phi i32 [ %87, %78 ], [ %76, %73 ]
  %80 = sub nsw i32 %79, %57
  %81 = getelementptr inbounds [32 x [33 x double]], [32 x [33 x double]] addrspace(3)* @_ZZ11__transposePdiS_iiiE4tile, i32 0, i32 %80, i32 %41
  %82 = load double, double addrspace(3)* %81, align 8, !tbaa !18
  %83 = mul nsw i32 %79, %3
  %84 = add i32 %83, %50
  %85 = zext i32 %84 to i64
  %86 = getelementptr inbounds double, double addrspace(1)* %2, i64 %85
  store double %82, double addrspace(1)* %86, align 8, !tbaa !18
  %87 = add i32 %79, %27
  %88 = icmp slt i32 %87, %75
  br i1 %88, label %78, label %89, !llvm.loop !23

89:                                               ; preds = %78, %73, %72
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %90 = add nsw i32 %57, %20
  %91 = icmp slt i32 %90, %4
  br i1 %91, label %56, label %53, !llvm.loop !24
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{!5, !9, i64 16}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = !{!19, !19, i64 0}
!19 = !{!"double", !20, i64 0}
!20 = !{!"omnipotent char", !21, i64 0}
!21 = !{!"Simple C++ TBAA"}
!22 = distinct !{!22, !17}
!23 = distinct !{!23, !17}
!24 = distinct !{!24, !17}
