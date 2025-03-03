; ModuleID = '../data/hip_kernels/8292/19/main.cu'
source_filename = "../data/hip_kernels/8292/19/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20query_ball_point_gpuiiiPKfiS0_S0_Pi(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %10 = mul nuw nsw i32 %9, 3
  %11 = mul i32 %10, %1
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds float, float addrspace(1)* %5, i64 %12
  %14 = mul i32 %10, %2
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds float, float addrspace(1)* %6, i64 %15
  %17 = mul i32 %9, %2
  %18 = mul i32 %17, %4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %19
  %21 = icmp sgt i32 %2, 0
  br i1 %21, label %22, label %49

22:                                               ; preds = %8
  %23 = icmp slt i32 %1, 1
  %24 = icmp eq i32 %4, 0
  %25 = select i1 %23, i1 true, i1 %24
  %26 = icmp slt i32 %4, 1
  %27 = add i32 %4, -1
  %28 = and i32 %4, 7
  %29 = icmp ult i32 %27, 7
  %30 = and i32 %4, -8
  %31 = icmp eq i32 %28, 0
  br label %32

32:                                               ; preds = %22, %159
  %33 = phi i32 [ 0, %22 ], [ %160, %159 ]
  br i1 %25, label %159, label %34

34:                                               ; preds = %32
  %35 = mul nsw i32 %33, 3
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds float, float addrspace(1)* %16, i64 %36
  %38 = load float, float addrspace(1)* %37, align 4, !tbaa !5, !amdgpu.noclobber !9
  %39 = add nuw nsw i32 %35, 1
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds float, float addrspace(1)* %16, i64 %40
  %42 = load float, float addrspace(1)* %41, align 4, !tbaa !5, !amdgpu.noclobber !9
  %43 = add nuw nsw i32 %35, 2
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %16, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !5, !amdgpu.noclobber !9
  %47 = load float, float addrspace(1)* %3, align 4, !tbaa !5, !amdgpu.noclobber !9
  %48 = mul nsw i32 %33, %4
  br label %50

49:                                               ; preds = %159, %8
  ret void

50:                                               ; preds = %34, %153
  %51 = phi i32 [ 0, %34 ], [ %154, %153 ]
  %52 = phi i32 [ 0, %34 ], [ %155, %153 ]
  %53 = mul nuw nsw i32 %52, 3
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %13, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !5, !amdgpu.noclobber !9
  %57 = add nuw nsw i32 %53, 1
  %58 = zext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %13, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !5, !amdgpu.noclobber !9
  %61 = add nuw nsw i32 %53, 2
  %62 = zext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %13, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !5, !amdgpu.noclobber !9
  %65 = fsub contract float %38, %56
  %66 = fmul contract float %65, %65
  %67 = fsub contract float %42, %60
  %68 = fmul contract float %67, %67
  %69 = fadd contract float %66, %68
  %70 = fsub contract float %46, %64
  %71 = fmul contract float %70, %70
  %72 = fadd contract float %69, %71
  %73 = fcmp olt float %72, 0x39F0000000000000
  %74 = select i1 %73, float 0x41F0000000000000, float 1.000000e+00
  %75 = fmul float %72, %74
  %76 = tail call float @llvm.sqrt.f32(float %75)
  %77 = bitcast float %76 to i32
  %78 = add nsw i32 %77, -1
  %79 = bitcast i32 %78 to float
  %80 = add nsw i32 %77, 1
  %81 = bitcast i32 %80 to float
  %82 = tail call i1 @llvm.amdgcn.class.f32(float %75, i32 608)
  %83 = select i1 %73, float 0x3EF0000000000000, float 1.000000e+00
  %84 = fneg float %81
  %85 = tail call float @llvm.fma.f32(float %84, float %76, float %75)
  %86 = fcmp ogt float %85, 0.000000e+00
  %87 = fneg float %79
  %88 = tail call float @llvm.fma.f32(float %87, float %76, float %75)
  %89 = fcmp ole float %88, 0.000000e+00
  %90 = select i1 %89, float %79, float %76
  %91 = select i1 %86, float %81, float %90
  %92 = fmul float %83, %91
  %93 = select i1 %82, float %75, float %92
  %94 = tail call float @llvm.maxnum.f32(float %93, float 0x3BC79CA100000000)
  %95 = fcmp contract olt float %94, %47
  br i1 %95, label %96, label %153

96:                                               ; preds = %50
  %97 = icmp ne i32 %51, 0
  %98 = select i1 %97, i1 true, i1 %26
  br i1 %98, label %148, label %99

99:                                               ; preds = %96
  br i1 %29, label %137, label %100

100:                                              ; preds = %99, %100
  %101 = phi i32 [ %134, %100 ], [ 0, %99 ]
  %102 = phi i32 [ %135, %100 ], [ 0, %99 ]
  %103 = add nsw i32 %101, %48
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %104
  store i32 %52, i32 addrspace(1)* %105, align 4, !tbaa !10
  %106 = or i32 %101, 1
  %107 = add nsw i32 %106, %48
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %108
  store i32 %52, i32 addrspace(1)* %109, align 4, !tbaa !10
  %110 = or i32 %101, 2
  %111 = add nsw i32 %110, %48
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %112
  store i32 %52, i32 addrspace(1)* %113, align 4, !tbaa !10
  %114 = or i32 %101, 3
  %115 = add nsw i32 %114, %48
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %116
  store i32 %52, i32 addrspace(1)* %117, align 4, !tbaa !10
  %118 = or i32 %101, 4
  %119 = add nsw i32 %118, %48
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %120
  store i32 %52, i32 addrspace(1)* %121, align 4, !tbaa !10
  %122 = or i32 %101, 5
  %123 = add nsw i32 %122, %48
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %124
  store i32 %52, i32 addrspace(1)* %125, align 4, !tbaa !10
  %126 = or i32 %101, 6
  %127 = add nsw i32 %126, %48
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %128
  store i32 %52, i32 addrspace(1)* %129, align 4, !tbaa !10
  %130 = or i32 %101, 7
  %131 = add nsw i32 %130, %48
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %132
  store i32 %52, i32 addrspace(1)* %133, align 4, !tbaa !10
  %134 = add nuw nsw i32 %101, 8
  %135 = add i32 %102, 8
  %136 = icmp eq i32 %135, %30
  br i1 %136, label %137, label %100, !llvm.loop !12

137:                                              ; preds = %100, %99
  %138 = phi i32 [ 0, %99 ], [ %134, %100 ]
  br i1 %31, label %148, label %139

139:                                              ; preds = %137, %139
  %140 = phi i32 [ %145, %139 ], [ %138, %137 ]
  %141 = phi i32 [ %146, %139 ], [ 0, %137 ]
  %142 = add nsw i32 %140, %48
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %143
  store i32 %52, i32 addrspace(1)* %144, align 4, !tbaa !10
  %145 = add nuw nsw i32 %140, 1
  %146 = add i32 %141, 1
  %147 = icmp eq i32 %146, %28
  br i1 %147, label %148, label %139, !llvm.loop !14

148:                                              ; preds = %137, %139, %96
  %149 = add nsw i32 %51, %48
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds i32, i32 addrspace(1)* %20, i64 %150
  store i32 %52, i32 addrspace(1)* %151, align 4, !tbaa !10
  %152 = add nsw i32 %51, 1
  br label %153

153:                                              ; preds = %148, %50
  %154 = phi i32 [ %152, %148 ], [ %51, %50 ]
  %155 = add nuw nsw i32 %52, 1
  %156 = icmp sge i32 %155, %1
  %157 = icmp eq i32 %154, %4
  %158 = select i1 %156, i1 true, i1 %157
  br i1 %158, label %159, label %50, !llvm.loop !16

159:                                              ; preds = %153, %32
  %160 = add nuw nsw i32 %33, 1
  %161 = icmp eq i32 %160, %2
  br i1 %161, label %49, label %32, !llvm.loop !17
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !13}
