; ModuleID = '../data/hip_kernels/16910/29/main.cu'
source_filename = "../data/hip_kernels/16910/29/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bestFilterPKdPKbPKiS4_PKfPiPf(double addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readnone %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  %16 = load i16, i16 addrspace(4)* %15, align 4, !range !9, !invariant.load !8
  %17 = zext i16 %16 to i32
  %18 = getelementptr inbounds i8, i8 addrspace(4)* %13, i64 12
  %19 = bitcast i8 addrspace(4)* %18 to i32 addrspace(4)*
  %20 = load i32, i32 addrspace(4)* %19, align 4, !tbaa !10
  %21 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %22 = mul i32 %21, %17
  %23 = udiv i32 %20, %17
  %24 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %25 = load double, double addrspace(1)* %24, align 8, !tbaa !4, !amdgpu.noclobber !8
  %26 = fptosi double %25 to i32
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %28 = add nsw i32 %22, %27
  %29 = icmp slt i32 %28, %9
  br i1 %29, label %30, label %112

30:                                               ; preds = %7
  %31 = mul i32 %23, %17
  %32 = icmp ugt i32 %20, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %23, %33
  %35 = icmp sgt i32 %12, 0
  %36 = mul nsw i32 %34, %17
  %37 = and i32 %12, 1
  %38 = icmp eq i32 %12, 1
  %39 = and i32 %12, -2
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %30, %107
  %42 = phi i32 [ %28, %30 ], [ %110, %107 ]
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %43
  store i32 0, i32 addrspace(1)* %44, align 4, !tbaa !20
  %45 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %43
  %46 = load i32, i32 addrspace(1)* %45, align 4, !tbaa !20
  br i1 %35, label %47, label %107

47:                                               ; preds = %41
  br i1 %38, label %88, label %48

48:                                               ; preds = %47, %83
  %49 = phi float [ %84, %83 ], [ 0.000000e+00, %47 ]
  %50 = phi i32 [ %85, %83 ], [ 0, %47 ]
  %51 = phi i32 [ %86, %83 ], [ 0, %47 ]
  %52 = mul nsw i32 %50, %26
  %53 = add nsw i32 %52, %46
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !22, !range !24, !amdgpu.noclobber !8
  %57 = icmp eq i8 %56, 0
  br i1 %57, label %66, label %58

58:                                               ; preds = %48
  %59 = mul nsw i32 %50, %9
  %60 = add nsw i32 %59, %42
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %4, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !25
  %64 = fcmp contract ogt float %63, %49
  br i1 %64, label %65, label %66

65:                                               ; preds = %58
  store i32 %50, i32 addrspace(1)* %44, align 4, !tbaa !20
  br label %66

66:                                               ; preds = %48, %65, %58
  %67 = phi float [ %63, %65 ], [ %49, %58 ], [ %49, %48 ]
  %68 = or i32 %50, 1
  %69 = mul nsw i32 %68, %26
  %70 = add nsw i32 %69, %46
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %71
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !22, !range !24, !amdgpu.noclobber !8
  %74 = icmp eq i8 %73, 0
  br i1 %74, label %83, label %75

75:                                               ; preds = %66
  %76 = mul nsw i32 %68, %9
  %77 = add nsw i32 %76, %42
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %4, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !25
  %81 = fcmp contract ogt float %80, %67
  br i1 %81, label %82, label %83

82:                                               ; preds = %75
  store i32 %68, i32 addrspace(1)* %44, align 4, !tbaa !20
  br label %83

83:                                               ; preds = %82, %75, %66
  %84 = phi float [ %80, %82 ], [ %67, %75 ], [ %67, %66 ]
  %85 = add nuw nsw i32 %50, 2
  %86 = add i32 %51, 2
  %87 = icmp eq i32 %86, %39
  br i1 %87, label %88, label %48, !llvm.loop !27

88:                                               ; preds = %83, %47
  %89 = phi float [ undef, %47 ], [ %84, %83 ]
  %90 = phi float [ 0.000000e+00, %47 ], [ %84, %83 ]
  %91 = phi i32 [ 0, %47 ], [ %85, %83 ]
  br i1 %40, label %107, label %92

92:                                               ; preds = %88
  %93 = mul nsw i32 %91, %26
  %94 = add nsw i32 %93, %46
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %95
  %97 = load i8, i8 addrspace(1)* %96, align 1, !tbaa !22, !range !24, !amdgpu.noclobber !8
  %98 = icmp eq i8 %97, 0
  br i1 %98, label %107, label %99

99:                                               ; preds = %92
  %100 = mul nsw i32 %91, %9
  %101 = add nsw i32 %100, %42
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds float, float addrspace(1)* %4, i64 %102
  %104 = load float, float addrspace(1)* %103, align 4, !tbaa !25
  %105 = fcmp contract ogt float %104, %90
  br i1 %105, label %106, label %107

106:                                              ; preds = %99
  store i32 %91, i32 addrspace(1)* %44, align 4, !tbaa !20
  br label %107

107:                                              ; preds = %88, %106, %99, %92, %41
  %108 = phi float [ 0.000000e+00, %41 ], [ %89, %88 ], [ %104, %106 ], [ %90, %99 ], [ %90, %92 ]
  %109 = getelementptr inbounds float, float addrspace(1)* %6, i64 %43
  store float %108, float addrspace(1)* %109, align 4, !tbaa !25
  %110 = add nsw i32 %42, %36
  %111 = icmp slt i32 %110, %9
  br i1 %111, label %41, label %112, !llvm.loop !29

112:                                              ; preds = %107, %7
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !5, i64 0}
!5 = !{!"double", !6, i64 0}
!6 = !{!"omnipotent char", !7, i64 0}
!7 = !{!"Simple C++ TBAA"}
!8 = !{}
!9 = !{i16 1, i16 1025}
!10 = !{!11, !15, i64 12}
!11 = !{!"hsa_kernel_dispatch_packet_s", !12, i64 0, !12, i64 2, !12, i64 4, !12, i64 6, !12, i64 8, !12, i64 10, !15, i64 12, !15, i64 16, !15, i64 20, !15, i64 24, !15, i64 28, !16, i64 32, !17, i64 40, !16, i64 48, !18, i64 56}
!12 = !{!"short", !13, i64 0}
!13 = !{!"omnipotent char", !14, i64 0}
!14 = !{!"Simple C/C++ TBAA"}
!15 = !{!"int", !13, i64 0}
!16 = !{!"long", !13, i64 0}
!17 = !{!"any pointer", !13, i64 0}
!18 = !{!"hsa_signal_s", !16, i64 0}
!19 = !{i32 0, i32 1024}
!20 = !{!21, !21, i64 0}
!21 = !{!"int", !6, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"bool", !6, i64 0}
!24 = !{i8 0, i8 2}
!25 = !{!26, !26, i64 0}
!26 = !{!"float", !6, i64 0}
!27 = distinct !{!27, !28}
!28 = !{!"llvm.loop.mustprogress"}
!29 = distinct !{!29, !28}
