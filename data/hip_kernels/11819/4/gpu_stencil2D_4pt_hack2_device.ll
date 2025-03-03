; ModuleID = '../data/hip_kernels/11819/4/main.cu'
source_filename = "../data/hip_kernels/11819/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem = internal unnamed_addr addrspace(3) global [3 x [502 x double]] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z23gpu_stencil2D_4pt_hack2PdS_ii(double addrspace(1)* nocapture writeonly %0, double addrspace(1)* nocapture readonly %1, i32 %2, i32 %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = mul i32 %5, 50
  %7 = mul i32 %6, %3
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = mul i32 %8, 500
  %10 = add i32 %7, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %12 = icmp ult i32 %11, 502
  %13 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %14 = getelementptr i8, i8 addrspace(4)* %13, i64 4
  %15 = bitcast i8 addrspace(4)* %14 to i16 addrspace(4)*
  br i1 %12, label %16, label %57

16:                                               ; preds = %4
  %17 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %18 = zext i16 %17 to i32
  br label %19

19:                                               ; preds = %16, %19
  %20 = phi i32 [ %11, %16 ], [ %26, %19 ]
  %21 = add nsw i32 %10, %20
  %22 = sext i32 %21 to i64
  %23 = getelementptr inbounds double, double addrspace(1)* %1, i64 %22
  %24 = load double, double addrspace(1)* %23, align 8, !tbaa !7, !amdgpu.noclobber !6
  %25 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 0, i32 %20
  store double %24, double addrspace(3)* %25, align 8, !tbaa !7
  %26 = add nuw nsw i32 %20, %18
  %27 = icmp ult i32 %26, 502
  br i1 %27, label %19, label %28, !llvm.loop !11

28:                                               ; preds = %19
  br i1 %12, label %29, label %57

29:                                               ; preds = %28
  %30 = add nsw i32 %10, %3
  %31 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %32 = zext i16 %31 to i32
  br label %33

33:                                               ; preds = %33, %29
  %34 = phi i32 [ %11, %29 ], [ %40, %33 ]
  %35 = add nsw i32 %30, %34
  %36 = sext i32 %35 to i64
  %37 = getelementptr inbounds double, double addrspace(1)* %1, i64 %36
  %38 = load double, double addrspace(1)* %37, align 8, !tbaa !7, !amdgpu.noclobber !6
  %39 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 1, i32 %34
  store double %38, double addrspace(3)* %39, align 8, !tbaa !7
  %40 = add nuw nsw i32 %34, %32
  %41 = icmp ult i32 %40, 502
  br i1 %41, label %33, label %42, !llvm.loop !11

42:                                               ; preds = %33
  br i1 %12, label %43, label %57

43:                                               ; preds = %42
  %44 = shl nsw i32 %3, 1
  %45 = add nsw i32 %44, %10
  %46 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %47 = zext i16 %46 to i32
  br label %48

48:                                               ; preds = %48, %43
  %49 = phi i32 [ %11, %43 ], [ %55, %48 ]
  %50 = add nsw i32 %45, %49
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds double, double addrspace(1)* %1, i64 %51
  %53 = load double, double addrspace(1)* %52, align 8, !tbaa !7, !amdgpu.noclobber !6
  %54 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 2, i32 %49
  store double %53, double addrspace(3)* %54, align 8, !tbaa !7
  %55 = add nuw nsw i32 %49, %47
  %56 = icmp ult i32 %55, 502
  br i1 %56, label %48, label %57, !llvm.loop !11

57:                                               ; preds = %48, %4, %28, %42
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %58 = add nuw nsw i32 %11, 1
  %59 = icmp ult i32 %11, 500
  br label %60

60:                                               ; preds = %57, %107
  %61 = phi i32 [ 2, %57 ], [ %111, %107 ]
  %62 = phi i32 [ 0, %57 ], [ %113, %107 ]
  %63 = phi i32 [ 1, %57 ], [ %109, %107 ]
  %64 = phi i32 [ 1, %57 ], [ %114, %107 ]
  br i1 %59, label %65, label %91

65:                                               ; preds = %60
  %66 = mul nsw i32 %64, %3
  %67 = add nsw i32 %66, %10
  %68 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %69 = zext i16 %68 to i32
  br label %70

70:                                               ; preds = %65, %70
  %71 = phi i32 [ %58, %65 ], [ %89, %70 ]
  %72 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 %62, i32 %71
  %73 = load double, double addrspace(3)* %72, align 8, !tbaa !7
  %74 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 %61, i32 %71
  %75 = load double, double addrspace(3)* %74, align 8, !tbaa !7
  %76 = fadd contract double %73, %75
  %77 = add nsw i32 %71, -1
  %78 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 %63, i32 %77
  %79 = load double, double addrspace(3)* %78, align 8, !tbaa !7
  %80 = fadd contract double %76, %79
  %81 = add nuw nsw i32 %71, 1
  %82 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 %63, i32 %81
  %83 = load double, double addrspace(3)* %82, align 8, !tbaa !7
  %84 = fadd contract double %80, %83
  %85 = fdiv contract double %84, 5.500000e+00
  %86 = add nsw i32 %67, %71
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double addrspace(1)* %0, i64 %87
  store double %85, double addrspace(1)* %88, align 8, !tbaa !7
  %89 = add nuw nsw i32 %71, %69
  %90 = icmp ult i32 %89, 501
  br i1 %90, label %70, label %91, !llvm.loop !13

91:                                               ; preds = %70, %60
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %12, label %92, label %107

92:                                               ; preds = %91
  %93 = add nuw nsw i32 %64, 2
  %94 = mul nsw i32 %93, %3
  %95 = add nsw i32 %94, %10
  %96 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %97 = zext i16 %96 to i32
  br label %98

98:                                               ; preds = %92, %98
  %99 = phi i32 [ %11, %92 ], [ %105, %98 ]
  %100 = add nsw i32 %95, %99
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds double, double addrspace(1)* %1, i64 %101
  %103 = load double, double addrspace(1)* %102, align 8, !tbaa !7
  %104 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 %62, i32 %99
  store double %103, double addrspace(3)* %104, align 8, !tbaa !7
  %105 = add nuw nsw i32 %99, %97
  %106 = icmp ult i32 %105, 502
  br i1 %106, label %98, label %107, !llvm.loop !14

107:                                              ; preds = %98, %91
  %108 = add nsw i32 %63, 1
  %109 = srem i32 %108, 3
  %110 = add nsw i32 %61, 1
  %111 = srem i32 %110, 3
  %112 = add nsw i32 %62, 1
  %113 = srem i32 %112, 3
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = add nuw nsw i32 %64, 1
  %115 = icmp eq i32 %114, 50
  br i1 %115, label %116, label %60, !llvm.loop !15

116:                                              ; preds = %107
  br i1 %59, label %117, label %143

117:                                              ; preds = %116
  %118 = mul nsw i32 %3, 50
  %119 = add nsw i32 %118, %10
  %120 = load i16, i16 addrspace(4)* %15, align 4, !range !5, !invariant.load !6
  %121 = zext i16 %120 to i32
  br label %122

122:                                              ; preds = %117, %122
  %123 = phi i32 [ %58, %117 ], [ %141, %122 ]
  %124 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 1, i32 %123
  %125 = load double, double addrspace(3)* %124, align 8, !tbaa !7
  %126 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 0, i32 %123
  %127 = load double, double addrspace(3)* %126, align 8, !tbaa !7
  %128 = fadd contract double %125, %127
  %129 = add nsw i32 %123, -1
  %130 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 2, i32 %129
  %131 = load double, double addrspace(3)* %130, align 8, !tbaa !7
  %132 = fadd contract double %128, %131
  %133 = add nuw nsw i32 %123, 1
  %134 = getelementptr inbounds [3 x [502 x double]], [3 x [502 x double]] addrspace(3)* @_ZZ23gpu_stencil2D_4pt_hack2PdS_iiE10shared_mem, i32 0, i32 2, i32 %133
  %135 = load double, double addrspace(3)* %134, align 8, !tbaa !7
  %136 = fadd contract double %132, %135
  %137 = fdiv contract double %136, 5.500000e+00
  %138 = add nsw i32 %119, %123
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds double, double addrspace(1)* %0, i64 %139
  store double %137, double addrspace(1)* %140, align 8, !tbaa !7
  %141 = add nuw nsw i32 %123, %121
  %142 = icmp ult i32 %141, 501
  br i1 %142, label %122, label %143, !llvm.loop !16

143:                                              ; preds = %122, %116
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!7 = !{!8, !8, i64 0}
!8 = !{!"double", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
