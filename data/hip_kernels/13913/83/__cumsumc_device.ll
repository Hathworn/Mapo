; ModuleID = '../data/hip_kernels/13913/83/main.cu'
source_filename = "../data/hip_kernels/13913/83/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ9__cumsumciiPdS_E4buff = internal unnamed_addr addrspace(3) global [32 x double] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z9__cumsumciiPdS_(i32 %0, i32 %1, double addrspace(1)* nocapture readonly %2, double addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 6
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 2, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = mul i32 %11, %10
  %13 = add i32 %12, %5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %14 = icmp slt i32 %13, %1
  br i1 %14, label %15, label %81

15:                                               ; preds = %4
  %16 = icmp sgt i32 %0, 0
  %17 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %18 = getelementptr inbounds [32 x double], [32 x double] addrspace(3)* @_ZZ9__cumsumciiPdS_E4buff, i32 0, i32 %17
  %19 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 4
  %22 = zext i16 %21 to i32
  %23 = uitofp i16 %21 to double
  %24 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %25 = bitcast i8 addrspace(4)* %24 to i32 addrspace(4)*
  %26 = load i32, i32 addrspace(4)* %25, align 4, !tbaa !7
  %27 = udiv i32 %26, %22
  %28 = mul i32 %27, %22
  %29 = icmp ugt i32 %26, %28
  %30 = zext i1 %29 to i32
  %31 = add i32 %27, %30
  %32 = mul i32 %31, %10
  br label %33

33:                                               ; preds = %15, %78
  %34 = phi i32 [ %13, %15 ], [ %79, %78 ]
  br i1 %16, label %35, label %78

35:                                               ; preds = %33
  %36 = mul nsw i32 %34, %0
  br label %37

37:                                               ; preds = %35, %74
  %38 = phi double [ 0.000000e+00, %35 ], [ %75, %74 ]
  %39 = phi i32 [ 0, %35 ], [ %76, %74 ]
  %40 = add i32 %39, %17
  %41 = icmp ult i32 %40, %0
  br i1 %41, label %42, label %47

42:                                               ; preds = %37
  %43 = add i32 %40, %36
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds double, double addrspace(1)* %2, i64 %44
  %46 = load double, double addrspace(1)* %45, align 8, !tbaa !16
  br label %47

47:                                               ; preds = %42, %37
  %48 = phi double [ %46, %42 ], [ 0.000000e+00, %37 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store double %48, double addrspace(3)* %18, align 8, !tbaa !16
  %49 = sub nsw i32 %0, %39
  %50 = sitofp i32 %49 to double
  %51 = tail call double @llvm.minnum.f64(double %23, double %50)
  %52 = fptosi double %51 to i32
  %53 = icmp sgt i32 %52, 1
  br i1 %53, label %54, label %67

54:                                               ; preds = %47, %63
  %55 = phi double [ %64, %63 ], [ %48, %47 ]
  %56 = phi i32 [ %65, %63 ], [ 1, %47 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %57 = icmp ult i32 %17, %56
  br i1 %57, label %63, label %58

58:                                               ; preds = %54
  %59 = sub i32 %17, %56
  %60 = getelementptr inbounds [32 x double], [32 x double] addrspace(3)* @_ZZ9__cumsumciiPdS_E4buff, i32 0, i32 %59
  %61 = load double, double addrspace(3)* %60, align 8, !tbaa !16
  %62 = fadd contract double %55, %61
  br label %63

63:                                               ; preds = %58, %54
  %64 = phi double [ %62, %58 ], [ %55, %54 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  store double %64, double addrspace(3)* %18, align 8, !tbaa !16
  %65 = shl nsw i32 %56, 1
  %66 = icmp slt i32 %65, %52
  br i1 %66, label %54, label %67, !llvm.loop !20

67:                                               ; preds = %63, %47
  %68 = phi double [ %48, %47 ], [ %64, %63 ]
  br i1 %41, label %69, label %74

69:                                               ; preds = %67
  %70 = fadd contract double %38, %68
  %71 = add i32 %40, %36
  %72 = zext i32 %71 to i64
  %73 = getelementptr inbounds double, double addrspace(1)* %3, i64 %72
  store double %70, double addrspace(1)* %73, align 8, !tbaa !16
  br label %74

74:                                               ; preds = %69, %67
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %75 = load double, double addrspace(3)* getelementptr inbounds ([32 x double], [32 x double] addrspace(3)* @_ZZ9__cumsumciiPdS_E4buff, i32 0, i32 31), align 8, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %76 = add i32 %39, %22
  %77 = icmp slt i32 %76, %0
  br i1 %77, label %37, label %78, !llvm.loop !23

78:                                               ; preds = %74, %33
  %79 = add i32 %32, %34
  %80 = icmp slt i32 %79, %1
  br i1 %80, label %33, label %81, !llvm.loop !24

81:                                               ; preds = %78, %4
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare double @llvm.minnum.f64(double, double) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #3

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
!17 = !{!"double", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21, !22}
!21 = !{!"llvm.loop.mustprogress"}
!22 = !{!"llvm.loop.unroll.enable"}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
