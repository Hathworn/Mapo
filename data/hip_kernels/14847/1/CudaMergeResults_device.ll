; ModuleID = '../data/hip_kernels/14847/1/main.cu'
source_filename = "../data/hip_kernels/14847/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.SubBlock = type { i32*, i32*, i32, i32*, i32*, float* }

; Function Attrs: mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z16CudaMergeResultsP8SubBlockPfS1_iiiiS1_(%struct.SubBlock addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readnone %1, float addrspace(1)* nocapture %2, i32 %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture readonly %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = icmp eq i32 %9, 0
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x()
  %12 = icmp eq i32 %11, 0
  %13 = select i1 %10, i1 %12, i1 false
  %14 = icmp sgt i32 %3, 0
  %15 = select i1 %13, i1 %14, i1 false
  br i1 %15, label %16, label %170

16:                                               ; preds = %8
  %17 = icmp sgt i32 %4, 0
  %18 = and i32 %4, 7
  %19 = icmp ult i32 %4, 8
  %20 = and i32 %4, -8
  %21 = icmp eq i32 %18, 0
  br label %22

22:                                               ; preds = %16, %50
  %23 = phi i32 [ 0, %16 ], [ %51, %50 ]
  %24 = zext i32 %23 to i64
  %25 = getelementptr inbounds %struct.SubBlock, %struct.SubBlock addrspace(1)* %0, i64 %24, i32 1
  %26 = load i32*, i32* addrspace(1)* %25, align 8, !tbaa !4, !amdgpu.noclobber !10
  br i1 %17, label %27, label %50

27:                                               ; preds = %22
  %28 = mul nsw i32 %23, %4
  br i1 %19, label %29, label %53

29:                                               ; preds = %53, %27
  %30 = phi i32 [ 0, %27 ], [ %167, %53 ]
  br i1 %21, label %50, label %31

31:                                               ; preds = %29, %31
  %32 = phi i32 [ %47, %31 ], [ %30, %29 ]
  %33 = phi i32 [ %48, %31 ], [ 0, %29 ]
  %34 = add nsw i32 %32, %28
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds float, float addrspace(1)* %7, i64 %35
  %37 = load float, float addrspace(1)* %36, align 4, !tbaa !11
  %38 = zext i32 %32 to i64
  %39 = getelementptr inbounds i32, i32* %26, i64 %38
  %40 = addrspacecast i32* %39 to i32 addrspace(1)*
  %41 = load i32, i32 addrspace(1)* %40, align 4, !tbaa !13, !amdgpu.noclobber !10
  %42 = add nsw i32 %41, -1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %2, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !11
  %46 = fadd contract float %37, %45
  store float %46, float addrspace(1)* %44, align 4, !tbaa !11
  %47 = add nuw nsw i32 %32, 1
  %48 = add i32 %33, 1
  %49 = icmp eq i32 %48, %18
  br i1 %49, label %50, label %31, !llvm.loop !14

50:                                               ; preds = %29, %31, %22
  %51 = add nuw nsw i32 %23, 1
  %52 = icmp eq i32 %51, %3
  br i1 %52, label %170, label %22, !llvm.loop !16

53:                                               ; preds = %27, %53
  %54 = phi i32 [ %167, %53 ], [ 0, %27 ]
  %55 = phi i32 [ %168, %53 ], [ 0, %27 ]
  %56 = add nsw i32 %54, %28
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %7, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !11
  %60 = zext i32 %54 to i64
  %61 = getelementptr inbounds i32, i32* %26, i64 %60
  %62 = addrspacecast i32* %61 to i32 addrspace(1)*
  %63 = load i32, i32 addrspace(1)* %62, align 4, !tbaa !13, !amdgpu.noclobber !10
  %64 = add nsw i32 %63, -1
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !11
  %68 = fadd contract float %59, %67
  store float %68, float addrspace(1)* %66, align 4, !tbaa !11
  %69 = or i32 %54, 1
  %70 = add nsw i32 %69, %28
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %7, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !11
  %74 = zext i32 %69 to i64
  %75 = getelementptr inbounds i32, i32* %26, i64 %74
  %76 = addrspacecast i32* %75 to i32 addrspace(1)*
  %77 = load i32, i32 addrspace(1)* %76, align 4, !tbaa !13, !amdgpu.noclobber !10
  %78 = add nsw i32 %77, -1
  %79 = sext i32 %78 to i64
  %80 = getelementptr inbounds float, float addrspace(1)* %2, i64 %79
  %81 = load float, float addrspace(1)* %80, align 4, !tbaa !11
  %82 = fadd contract float %73, %81
  store float %82, float addrspace(1)* %80, align 4, !tbaa !11
  %83 = or i32 %54, 2
  %84 = add nsw i32 %83, %28
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %7, i64 %85
  %87 = load float, float addrspace(1)* %86, align 4, !tbaa !11
  %88 = zext i32 %83 to i64
  %89 = getelementptr inbounds i32, i32* %26, i64 %88
  %90 = addrspacecast i32* %89 to i32 addrspace(1)*
  %91 = load i32, i32 addrspace(1)* %90, align 4, !tbaa !13, !amdgpu.noclobber !10
  %92 = add nsw i32 %91, -1
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds float, float addrspace(1)* %2, i64 %93
  %95 = load float, float addrspace(1)* %94, align 4, !tbaa !11
  %96 = fadd contract float %87, %95
  store float %96, float addrspace(1)* %94, align 4, !tbaa !11
  %97 = or i32 %54, 3
  %98 = add nsw i32 %97, %28
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds float, float addrspace(1)* %7, i64 %99
  %101 = load float, float addrspace(1)* %100, align 4, !tbaa !11
  %102 = zext i32 %97 to i64
  %103 = getelementptr inbounds i32, i32* %26, i64 %102
  %104 = addrspacecast i32* %103 to i32 addrspace(1)*
  %105 = load i32, i32 addrspace(1)* %104, align 4, !tbaa !13, !amdgpu.noclobber !10
  %106 = add nsw i32 %105, -1
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds float, float addrspace(1)* %2, i64 %107
  %109 = load float, float addrspace(1)* %108, align 4, !tbaa !11
  %110 = fadd contract float %101, %109
  store float %110, float addrspace(1)* %108, align 4, !tbaa !11
  %111 = or i32 %54, 4
  %112 = add nsw i32 %111, %28
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds float, float addrspace(1)* %7, i64 %113
  %115 = load float, float addrspace(1)* %114, align 4, !tbaa !11
  %116 = zext i32 %111 to i64
  %117 = getelementptr inbounds i32, i32* %26, i64 %116
  %118 = addrspacecast i32* %117 to i32 addrspace(1)*
  %119 = load i32, i32 addrspace(1)* %118, align 4, !tbaa !13, !amdgpu.noclobber !10
  %120 = add nsw i32 %119, -1
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %2, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !11
  %124 = fadd contract float %115, %123
  store float %124, float addrspace(1)* %122, align 4, !tbaa !11
  %125 = or i32 %54, 5
  %126 = add nsw i32 %125, %28
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %7, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !11
  %130 = zext i32 %125 to i64
  %131 = getelementptr inbounds i32, i32* %26, i64 %130
  %132 = addrspacecast i32* %131 to i32 addrspace(1)*
  %133 = load i32, i32 addrspace(1)* %132, align 4, !tbaa !13, !amdgpu.noclobber !10
  %134 = add nsw i32 %133, -1
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds float, float addrspace(1)* %2, i64 %135
  %137 = load float, float addrspace(1)* %136, align 4, !tbaa !11
  %138 = fadd contract float %129, %137
  store float %138, float addrspace(1)* %136, align 4, !tbaa !11
  %139 = or i32 %54, 6
  %140 = add nsw i32 %139, %28
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds float, float addrspace(1)* %7, i64 %141
  %143 = load float, float addrspace(1)* %142, align 4, !tbaa !11
  %144 = zext i32 %139 to i64
  %145 = getelementptr inbounds i32, i32* %26, i64 %144
  %146 = addrspacecast i32* %145 to i32 addrspace(1)*
  %147 = load i32, i32 addrspace(1)* %146, align 4, !tbaa !13, !amdgpu.noclobber !10
  %148 = add nsw i32 %147, -1
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds float, float addrspace(1)* %2, i64 %149
  %151 = load float, float addrspace(1)* %150, align 4, !tbaa !11
  %152 = fadd contract float %143, %151
  store float %152, float addrspace(1)* %150, align 4, !tbaa !11
  %153 = or i32 %54, 7
  %154 = add nsw i32 %153, %28
  %155 = sext i32 %154 to i64
  %156 = getelementptr inbounds float, float addrspace(1)* %7, i64 %155
  %157 = load float, float addrspace(1)* %156, align 4, !tbaa !11
  %158 = zext i32 %153 to i64
  %159 = getelementptr inbounds i32, i32* %26, i64 %158
  %160 = addrspacecast i32* %159 to i32 addrspace(1)*
  %161 = load i32, i32 addrspace(1)* %160, align 4, !tbaa !13, !amdgpu.noclobber !10
  %162 = add nsw i32 %161, -1
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %2, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !11
  %166 = fadd contract float %157, %165
  store float %166, float addrspace(1)* %164, align 4, !tbaa !11
  %167 = add nuw nsw i32 %54, 8
  %168 = add i32 %55, 8
  %169 = icmp eq i32 %168, %20
  br i1 %169, label %29, label %53, !llvm.loop !18

170:                                              ; preds = %50, %8
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

attributes #0 = { mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{!5, !6, i64 8}
!5 = !{!"_ZTS8SubBlock", !6, i64 0, !6, i64 8, !9, i64 16, !6, i64 24, !6, i64 32, !6, i64 40}
!6 = !{!"any pointer", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{}
!11 = !{!12, !12, i64 0}
!12 = !{!"float", !7, i64 0}
!13 = !{!9, !9, i64 0}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !17}
!17 = !{!"llvm.loop.mustprogress"}
!18 = distinct !{!18, !17}
