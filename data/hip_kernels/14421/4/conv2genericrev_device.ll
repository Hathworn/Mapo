; ModuleID = '../data/hip_kernels/14421/4/main.cu'
source_filename = "../data/hip_kernels/14421/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ15conv2genericrevPfS_S_iiiiiifiiE13shared_output = internal unnamed_addr addrspace(3) global [12256 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z15conv2genericrevPfS_S_iiiiiifii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, float %9, i32 %10, i32 %11) local_unnamed_addr #0 {
  %13 = add nsw i32 %7, -1
  %14 = mul nsw i32 %13, %10
  %15 = sub nsw i32 %4, %14
  %16 = add nsw i32 %8, -1
  %17 = mul nsw i32 %16, %11
  %18 = sub nsw i32 %5, %17
  %19 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %21 = tail call i32 @llvm.amdgcn.workitem.id.z(), !range !4
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %23 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %24 = getelementptr i8, i8 addrspace(4)* %23, i64 4
  %25 = bitcast i8 addrspace(4)* %24 to i16 addrspace(4)*
  %26 = load i16, i16 addrspace(4)* %25, align 4, !range !5, !invariant.load !6
  %27 = zext i16 %26 to i32
  %28 = mul nuw nsw i32 %21, %27
  %29 = add nuw nsw i32 %28, %22
  %30 = getelementptr i8, i8 addrspace(4)* %23, i64 8
  %31 = bitcast i8 addrspace(4)* %30 to i16 addrspace(4)*
  %32 = load i16, i16 addrspace(4)* %31, align 4, !range !5, !invariant.load !6
  %33 = zext i16 %32 to i32
  %34 = mul nuw nsw i32 %33, %27
  %35 = mul nsw i32 %19, %3
  %36 = add nsw i32 %35, %20
  %37 = mul i32 %18, %15
  %38 = mul i32 %37, %36
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds float, float addrspace(1)* %2, i64 %39
  %41 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %42 = icmp sgt i32 %18, 0
  br i1 %42, label %43, label %103

43:                                               ; preds = %12
  %44 = mul i32 %37, %29
  %45 = getelementptr inbounds [12256 x float], [12256 x float] addrspace(3)* @_ZZ15conv2genericrevPfS_S_iiiiiifiiE13shared_output, i32 0, i32 %44
  %46 = mul nsw i32 %18, %41
  %47 = getelementptr inbounds float, float addrspace(3)* %45, i32 %46
  %48 = mul nsw i32 %21, %3
  %49 = add nsw i32 %48, %20
  %50 = mul nsw i32 %49, %4
  %51 = mul nsw i32 %50, %5
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = mul i32 %41, %5
  %55 = mul i32 %54, %10
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %53, i64 %56
  %58 = mul nsw i32 %21, %6
  %59 = add nsw i32 %58, %19
  %60 = mul i32 %8, %7
  %61 = mul i32 %60, %59
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %1, i64 %62
  %64 = icmp sgt i32 %7, 0
  %65 = icmp slt i32 %22, %8
  %66 = sext i32 %5 to i64
  %67 = sext i32 %8 to i64
  br label %68

68:                                               ; preds = %43, %98
  %69 = phi float addrspace(3)* [ %47, %43 ], [ %100, %98 ]
  %70 = phi i32 [ 0, %43 ], [ %101, %98 ]
  br i1 %64, label %71, label %98

71:                                               ; preds = %68
  %72 = mul nsw i32 %70, %11
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %57, i64 %73
  br label %75

75:                                               ; preds = %71, %92
  %76 = phi float [ %93, %92 ], [ 0.000000e+00, %71 ]
  %77 = phi float addrspace(1)* [ %95, %92 ], [ %63, %71 ]
  %78 = phi float addrspace(1)* [ %94, %92 ], [ %74, %71 ]
  %79 = phi i32 [ %96, %92 ], [ 0, %71 ]
  br i1 %65, label %80, label %92

80:                                               ; preds = %75, %80
  %81 = phi float [ %89, %80 ], [ %76, %75 ]
  %82 = phi i32 [ %90, %80 ], [ %22, %75 ]
  %83 = zext i32 %82 to i64
  %84 = getelementptr inbounds float, float addrspace(1)* %78, i64 %83
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !7
  %86 = getelementptr inbounds float, float addrspace(1)* %77, i64 %83
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !7
  %88 = fmul contract float %85, %87
  %89 = fadd contract float %81, %88
  %90 = add nuw nsw i32 %82, %27
  %91 = icmp slt i32 %90, %8
  br i1 %91, label %80, label %92, !llvm.loop !11

92:                                               ; preds = %80, %75
  %93 = phi float [ %76, %75 ], [ %89, %80 ]
  %94 = getelementptr inbounds float, float addrspace(1)* %78, i64 %66
  %95 = getelementptr inbounds float, float addrspace(1)* %77, i64 %67
  %96 = add nuw nsw i32 %79, 1
  %97 = icmp eq i32 %96, %7
  br i1 %97, label %98, label %75, !llvm.loop !13

98:                                               ; preds = %92, %68
  %99 = phi float [ 0.000000e+00, %68 ], [ %93, %92 ]
  %100 = getelementptr inbounds float, float addrspace(3)* %69, i32 1
  store float %99, float addrspace(3)* %69, align 4, !tbaa !7
  %101 = add nuw nsw i32 %70, 1
  %102 = icmp slt i32 %101, %18
  br i1 %102, label %68, label %103, !llvm.loop !14

103:                                              ; preds = %98, %12
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %104 = icmp eq i32 %41, 0
  br i1 %104, label %105, label %139

105:                                              ; preds = %103
  %106 = icmp ugt i32 %34, 1
  br i1 %106, label %107, label %113

107:                                              ; preds = %105
  %108 = icmp slt i32 %29, %37
  br label %109

109:                                              ; preds = %107, %115
  %110 = phi i32 [ 1, %107 ], [ %116, %115 ]
  br i1 %108, label %111, label %115

111:                                              ; preds = %109
  %112 = mul i32 %37, %110
  br label %118

113:                                              ; preds = %115, %105
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %114 = icmp slt i32 %29, %37
  br i1 %114, label %128, label %139

115:                                              ; preds = %118, %109
  %116 = add nuw nsw i32 %110, 1
  %117 = icmp eq i32 %116, %34
  br i1 %117, label %113, label %109, !llvm.loop !15

118:                                              ; preds = %111, %118
  %119 = phi i32 [ %29, %111 ], [ %126, %118 ]
  %120 = add nsw i32 %119, %112
  %121 = getelementptr inbounds [12256 x float], [12256 x float] addrspace(3)* @_ZZ15conv2genericrevPfS_S_iiiiiifiiE13shared_output, i32 0, i32 %120
  %122 = load float, float addrspace(3)* %121, align 4, !tbaa !7
  %123 = getelementptr inbounds [12256 x float], [12256 x float] addrspace(3)* @_ZZ15conv2genericrevPfS_S_iiiiiifiiE13shared_output, i32 0, i32 %119
  %124 = load float, float addrspace(3)* %123, align 4, !tbaa !7
  %125 = fadd contract float %122, %124
  store float %125, float addrspace(3)* %123, align 4, !tbaa !7
  %126 = add nuw nsw i32 %119, %34
  %127 = icmp slt i32 %126, %37
  br i1 %127, label %118, label %115, !llvm.loop !16

128:                                              ; preds = %113, %128
  %129 = phi i32 [ %137, %128 ], [ %29, %113 ]
  %130 = zext i32 %129 to i64
  %131 = getelementptr inbounds [12256 x float], [12256 x float] addrspace(3)* @_ZZ15conv2genericrevPfS_S_iiiiiifiiE13shared_output, i32 0, i32 %129
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !7
  %133 = fmul contract float %132, %9
  %134 = getelementptr inbounds float, float addrspace(1)* %40, i64 %130
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !7
  %136 = fadd contract float %135, %133
  store float %136, float addrspace(1)* %134, align 4, !tbaa !7
  %137 = add nuw nsw i32 %129, %34
  %138 = icmp slt i32 %137, %37
  br i1 %138, label %128, label %139, !llvm.loop !17

139:                                              ; preds = %128, %113, %103
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.z() #2

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
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = distinct !{!11, !12}
!12 = !{!"llvm.loop.mustprogress"}
!13 = distinct !{!13, !12}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !12}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
