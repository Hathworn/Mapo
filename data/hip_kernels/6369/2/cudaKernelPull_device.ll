; ModuleID = '../data/hip_kernels/6369/2/main.cu'
source_filename = "../data/hip_kernels/6369/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z14cudaKernelPullPfS_iS_fS_PbfPif(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture %1, i32 %2, float addrspace(1)* nocapture %3, float %4, float addrspace(1)* nocapture %5, i8 addrspace(1)* nocapture %6, float %7, i32 addrspace(1)* nocapture readonly %8, float %9) local_unnamed_addr #0 {
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %13 = sext i32 %11 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %3, i64 %13
  %15 = icmp eq i32 %12, 0
  %16 = getelementptr inbounds i8, i8 addrspace(1)* %6, i64 %13
  %17 = icmp sgt i32 %2, 0
  %18 = add nsw i32 %2, 1
  %19 = mul nsw i32 %11, %2
  %20 = tail call align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %21 = getelementptr i8, i8 addrspace(4)* %20, i64 4
  %22 = bitcast i8 addrspace(4)* %21 to i16 addrspace(4)*
  %23 = sext i32 %19 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %5, i64 %23
  %25 = fsub contract float 1.000000e+00, %9
  br label %26

26:                                               ; preds = %158, %10
  br i1 %15, label %27, label %30

27:                                               ; preds = %26
  %28 = load float, float addrspace(1)* %14, align 4, !tbaa !5
  %29 = fsub contract float %28, %4
  store float %29, float addrspace(1)* %14, align 4, !tbaa !5
  br label %30

30:                                               ; preds = %27, %26
  br label %31

31:                                               ; preds = %30, %34
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %15, label %32, label %33

32:                                               ; preds = %31
  store i8 0, i8 addrspace(1)* %16, align 1, !tbaa !9
  br label %33

33:                                               ; preds = %32, %31
  br i1 %17, label %37, label %34

34:                                               ; preds = %155, %33
  %35 = load i8, i8 addrspace(1)* %16, align 1, !tbaa !9, !range !11
  %36 = icmp eq i8 %35, 0
  br i1 %36, label %158, label %31, !llvm.loop !12

37:                                               ; preds = %33, %155
  %38 = phi i32 [ %156, %155 ], [ 0, %33 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %39 = mul nsw i32 %38, %18
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %40
  %42 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !14
  %43 = icmp slt i32 %12, %42
  br i1 %43, label %44, label %69

44:                                               ; preds = %37
  %45 = add i32 %39, 1
  %46 = mul nsw i32 %38, %2
  %47 = load i16, i16 addrspace(4)* %22, align 4, !range !16, !invariant.load !17
  %48 = zext i16 %47 to i32
  br label %49

49:                                               ; preds = %44, %49
  %50 = phi i32 [ %12, %44 ], [ %67, %49 ]
  %51 = add i32 %45, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %52
  %54 = load i32, i32 addrspace(1)* %53, align 4, !tbaa !14
  %55 = add nsw i32 %54, %19
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds float, float addrspace(1)* %1, i64 %56
  %58 = load float, float addrspace(1)* %57, align 4, !tbaa !5
  %59 = add nsw i32 %54, %46
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds float, float addrspace(1)* %0, i64 %60
  %62 = load float, float addrspace(1)* %61, align 4, !tbaa !5
  %63 = fmul contract float %58, %62
  %64 = add nsw i32 %50, %19
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %5, i64 %65
  store float %63, float addrspace(1)* %66, align 4, !tbaa !5
  %67 = add i32 %50, %48
  %68 = icmp slt i32 %67, %42
  br i1 %68, label %49, label %69, !llvm.loop !18

69:                                               ; preds = %49, %37
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %70 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !14
  %71 = icmp sgt i32 %70, 1
  br i1 %71, label %72, label %102

72:                                               ; preds = %69
  %73 = zext i32 %70 to i64
  br label %74

74:                                               ; preds = %72, %97
  %75 = phi i64 [ %100, %97 ], [ %73, %72 ]
  %76 = phi i64 [ %98, %97 ], [ 1, %72 ]
  br label %77

77:                                               ; preds = %74, %84
  %78 = phi i32 [ %96, %84 ], [ %12, %74 ]
  %79 = shl nsw i32 %78, 1
  %80 = add nuw nsw i32 %79, 1
  %81 = sext i32 %80 to i64
  %82 = mul nsw i64 %76, %81
  %83 = icmp slt i64 %82, %75
  br i1 %83, label %84, label %97

84:                                               ; preds = %77
  %85 = add nsw i64 %82, %23
  %86 = getelementptr inbounds float, float addrspace(1)* %5, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !5
  %88 = sext i32 %79 to i64
  %89 = mul nsw i64 %76, %88
  %90 = add nsw i64 %89, %23
  %91 = getelementptr inbounds float, float addrspace(1)* %5, i64 %90
  %92 = load float, float addrspace(1)* %91, align 4, !tbaa !5
  %93 = fadd contract float %87, %92
  store float %93, float addrspace(1)* %91, align 4, !tbaa !5
  %94 = load i16, i16 addrspace(4)* %22, align 4, !range !16, !invariant.load !17
  %95 = zext i16 %94 to i32
  %96 = add i32 %78, %95
  br label %77, !llvm.loop !19

97:                                               ; preds = %77
  %98 = shl nsw i64 %76, 1
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %99 = load i32, i32 addrspace(1)* %41, align 4, !tbaa !14
  %100 = sext i32 %99 to i64
  %101 = icmp slt i64 %98, %100
  br i1 %101, label %74, label %102, !llvm.loop !20

102:                                              ; preds = %97, %69
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %15, label %103, label %155

103:                                              ; preds = %102
  %104 = load float, float addrspace(1)* %24, align 4, !tbaa !5
  %105 = add nsw i32 %38, %19
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %1, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !5
  %109 = load float, float addrspace(1)* %14, align 4, !tbaa !5
  %110 = fcmp contract ogt float %109, 0.000000e+00
  br i1 %110, label %111, label %146

111:                                              ; preds = %103
  %112 = fdiv contract float %104, %109
  %113 = tail call float @llvm.fabs.f32(float %112)
  %114 = fcmp olt float %113, 6.250000e-01
  br i1 %114, label %115, label %123

115:                                              ; preds = %111
  %116 = fmul float %112, %112
  %117 = tail call float @llvm.fmuladd.f32(float %116, float 0xBF7758E7A0000000, float 0x3F95211920000000)
  %118 = tail call float @llvm.fmuladd.f32(float %116, float %117, float 0xBFAB8389C0000000)
  %119 = tail call float @llvm.fmuladd.f32(float %116, float %118, float 0x3FC1107040000000)
  %120 = tail call float @llvm.fmuladd.f32(float %116, float %119, float 0xBFD5555320000000)
  %121 = fmul float %113, %120
  %122 = tail call float @llvm.fmuladd.f32(float %116, float %121, float %113)
  br label %140

123:                                              ; preds = %111
  %124 = fmul float %113, 2.000000e+00
  %125 = fmul float %124, 0x3FF7154760000000
  %126 = tail call float @llvm.rint.f32(float %125)
  %127 = fcmp ogt float %124, 0x40562E4300000000
  %128 = fneg float %125
  %129 = tail call float @llvm.fma.f32(float %124, float 0x3FF7154760000000, float %128)
  %130 = tail call float @llvm.fma.f32(float %124, float 0x3E54AE0BE0000000, float %129)
  %131 = fsub float %125, %126
  %132 = fadd float %130, %131
  %133 = tail call float @llvm.exp2.f32(float %132)
  %134 = fptosi float %126 to i32
  %135 = tail call float @llvm.amdgcn.ldexp.f32(float %133, i32 %134)
  %136 = fadd float %135, 1.000000e+00
  %137 = select i1 %127, float 0x7FF0000000000000, float %136
  %138 = tail call float @llvm.amdgcn.rcp.f32(float %137)
  %139 = tail call float @llvm.fmuladd.f32(float %138, float -2.000000e+00, float 1.000000e+00)
  br label %140

140:                                              ; preds = %115, %123
  %141 = phi float [ %122, %115 ], [ %139, %123 ]
  %142 = tail call float @llvm.copysign.f32(float %141, float %112)
  %143 = fmul contract float %25, %108
  %144 = fmul contract float %142, %9
  %145 = fsub contract float %143, %144
  br label %149

146:                                              ; preds = %103
  %147 = fcmp contract ogt float %104, 0.000000e+00
  %148 = select i1 %147, float -1.000000e+00, float 1.000000e+00
  br label %149

149:                                              ; preds = %146, %140
  %150 = phi float [ %145, %140 ], [ %148, %146 ]
  store float %150, float addrspace(1)* %107, align 4, !tbaa !5
  %151 = fsub contract float %108, %150
  %152 = tail call float @llvm.fabs.f32(float %151)
  %153 = fcmp contract ogt float %152, %7
  br i1 %153, label %154, label %155

154:                                              ; preds = %149
  store i8 1, i8 addrspace(1)* %16, align 1, !tbaa !9
  br label %155

155:                                              ; preds = %149, %154, %102
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %156 = add nuw nsw i32 %38, 1
  %157 = icmp eq i32 %156, %2
  br i1 %157, label %34, label %37, !llvm.loop !21

158:                                              ; preds = %34
  %159 = load float, float addrspace(1)* %14, align 4, !tbaa !5
  %160 = fcmp contract ult float %159, 0.000000e+00
  br i1 %160, label %161, label %26, !llvm.loop !22

161:                                              ; preds = %158
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.rcp.f32(float) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.copysign.f32(float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.amdgcn.ldexp.f32(float, i32) #3

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #3

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #3

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
!9 = !{!10, !10, i64 0}
!10 = !{!"bool", !7, i64 0}
!11 = !{i8 0, i8 2}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = !{!15, !15, i64 0}
!15 = !{!"int", !7, i64 0}
!16 = !{i16 1, i16 1025}
!17 = !{}
!18 = distinct !{!18, !13}
!19 = distinct !{!19, !13}
!20 = distinct !{!20, !13}
!21 = distinct !{!21, !13}
!22 = distinct !{!22, !13}
