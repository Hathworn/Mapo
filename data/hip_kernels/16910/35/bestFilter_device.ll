; ModuleID = '../data/hip_kernels/16910/35/main.cu'
source_filename = "../data/hip_kernels/16910/35/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z10bestFilterPKdPKbPKiPKfS6_PiPf(double addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i32 addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, i32 addrspace(1)* nocapture writeonly %5, float addrspace(1)* nocapture writeonly %6) local_unnamed_addr #0 {
  %8 = load double, double addrspace(1)* %0, align 8, !tbaa !4, !amdgpu.noclobber !8
  %9 = fptosi double %8 to i32
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 2
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !4, !amdgpu.noclobber !8
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 7
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !4, !amdgpu.noclobber !8
  %15 = fptosi double %14 to i32
  %16 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %17 = getelementptr i8, i8 addrspace(4)* %16, i64 4
  %18 = bitcast i8 addrspace(4)* %17 to i16 addrspace(4)*
  %19 = load i16, i16 addrspace(4)* %18, align 4, !range !9, !invariant.load !8
  %20 = zext i16 %19 to i32
  %21 = getelementptr inbounds i8, i8 addrspace(4)* %16, i64 12
  %22 = bitcast i8 addrspace(4)* %21 to i32 addrspace(4)*
  %23 = load i32, i32 addrspace(4)* %22, align 4, !tbaa !10
  %24 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %25 = mul i32 %24, %20
  %26 = udiv i32 %23, %20
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !19
  %28 = add nsw i32 %25, %27
  %29 = icmp slt i32 %28, %9
  br i1 %29, label %30, label %115

30:                                               ; preds = %7
  %31 = mul i32 %26, %20
  %32 = icmp ugt i32 %23, %31
  %33 = zext i1 %32 to i32
  %34 = add i32 %26, %33
  %35 = icmp sgt i32 %12, 0
  %36 = mul nsw i32 %34, %20
  %37 = and i32 %12, 1
  %38 = icmp eq i32 %12, 1
  %39 = and i32 %12, -2
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %30, %110
  %42 = phi i32 [ %28, %30 ], [ %113, %110 ]
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %4, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !20
  %46 = fmul contract float %45, %45
  %47 = getelementptr inbounds i32, i32 addrspace(1)* %5, i64 %43
  store i32 0, i32 addrspace(1)* %47, align 4, !tbaa !22
  %48 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %43
  %49 = load i32, i32 addrspace(1)* %48, align 4, !tbaa !22
  br i1 %35, label %50, label %110

50:                                               ; preds = %41
  br i1 %38, label %91, label %51

51:                                               ; preds = %50, %86
  %52 = phi float [ %87, %86 ], [ %46, %50 ]
  %53 = phi i32 [ %88, %86 ], [ 0, %50 ]
  %54 = phi i32 [ %89, %86 ], [ 0, %50 ]
  %55 = mul nsw i32 %53, %15
  %56 = add nsw i32 %55, %49
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %57
  %59 = load i8, i8 addrspace(1)* %58, align 1, !tbaa !24, !range !26, !amdgpu.noclobber !8
  %60 = icmp eq i8 %59, 0
  br i1 %60, label %69, label %61

61:                                               ; preds = %51
  %62 = mul nsw i32 %53, %9
  %63 = add nsw i32 %62, %42
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds float, float addrspace(1)* %3, i64 %64
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !20
  %67 = fcmp contract olt float %66, %52
  br i1 %67, label %68, label %69

68:                                               ; preds = %61
  store i32 %53, i32 addrspace(1)* %47, align 4, !tbaa !22
  br label %69

69:                                               ; preds = %51, %68, %61
  %70 = phi float [ %66, %68 ], [ %52, %61 ], [ %52, %51 ]
  %71 = or i32 %53, 1
  %72 = mul nsw i32 %71, %15
  %73 = add nsw i32 %72, %49
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %74
  %76 = load i8, i8 addrspace(1)* %75, align 1, !tbaa !24, !range !26, !amdgpu.noclobber !8
  %77 = icmp eq i8 %76, 0
  br i1 %77, label %86, label %78

78:                                               ; preds = %69
  %79 = mul nsw i32 %71, %9
  %80 = add nsw i32 %79, %42
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds float, float addrspace(1)* %3, i64 %81
  %83 = load float, float addrspace(1)* %82, align 4, !tbaa !20
  %84 = fcmp contract olt float %83, %70
  br i1 %84, label %85, label %86

85:                                               ; preds = %78
  store i32 %71, i32 addrspace(1)* %47, align 4, !tbaa !22
  br label %86

86:                                               ; preds = %85, %78, %69
  %87 = phi float [ %83, %85 ], [ %70, %78 ], [ %70, %69 ]
  %88 = add nuw nsw i32 %53, 2
  %89 = add i32 %54, 2
  %90 = icmp eq i32 %89, %39
  br i1 %90, label %91, label %51, !llvm.loop !27

91:                                               ; preds = %86, %50
  %92 = phi float [ undef, %50 ], [ %87, %86 ]
  %93 = phi float [ %46, %50 ], [ %87, %86 ]
  %94 = phi i32 [ 0, %50 ], [ %88, %86 ]
  br i1 %40, label %110, label %95

95:                                               ; preds = %91
  %96 = mul nsw i32 %94, %15
  %97 = add nsw i32 %96, %49
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %98
  %100 = load i8, i8 addrspace(1)* %99, align 1, !tbaa !24, !range !26, !amdgpu.noclobber !8
  %101 = icmp eq i8 %100, 0
  br i1 %101, label %110, label %102

102:                                              ; preds = %95
  %103 = mul nsw i32 %94, %9
  %104 = add nsw i32 %103, %42
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %3, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !20
  %108 = fcmp contract olt float %107, %93
  br i1 %108, label %109, label %110

109:                                              ; preds = %102
  store i32 %94, i32 addrspace(1)* %47, align 4, !tbaa !22
  br label %110

110:                                              ; preds = %91, %109, %102, %95, %41
  %111 = phi float [ %46, %41 ], [ %92, %91 ], [ %107, %109 ], [ %93, %102 ], [ %93, %95 ]
  %112 = getelementptr inbounds float, float addrspace(1)* %6, i64 %43
  store float %111, float addrspace(1)* %112, align 4, !tbaa !20
  %113 = add nsw i32 %42, %36
  %114 = icmp slt i32 %113, %9
  br i1 %114, label %41, label %115, !llvm.loop !29

115:                                              ; preds = %110, %7
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
!21 = !{!"float", !6, i64 0}
!22 = !{!23, !23, i64 0}
!23 = !{!"int", !6, i64 0}
!24 = !{!25, !25, i64 0}
!25 = !{!"bool", !6, i64 0}
!26 = !{i8 0, i8 2}
!27 = distinct !{!27, !28}
!28 = !{!"llvm.loop.mustprogress"}
!29 = distinct !{!29, !28}
