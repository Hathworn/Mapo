; ModuleID = '../data/hip_kernels/8292/15/main.cu'
source_filename = "../data/hip_kernels/8292/15/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z20query_ball_point_gpuiiiPKfiS0_S0_PiS1_(i32 %0, i32 %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, float addrspace(1)* nocapture readonly %5, float addrspace(1)* nocapture readonly %6, i32 addrspace(1)* nocapture writeonly %7, i32 addrspace(1)* nocapture writeonly %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = mul i32 %10, 3
  %12 = mul i32 %11, %1
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %5, i64 %13
  %15 = mul i32 %10, %2
  %16 = mul i32 %15, 3
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds float, float addrspace(1)* %6, i64 %17
  %19 = mul i32 %15, %4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i32, i32 addrspace(1)* %7, i64 %20
  %22 = sext i32 %15 to i64
  %23 = getelementptr inbounds i32, i32 addrspace(1)* %8, i64 %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %25 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %26 = getelementptr i8, i8 addrspace(4)* %25, i64 4
  %27 = bitcast i8 addrspace(4)* %26 to i16 addrspace(4)*
  %28 = load i16, i16 addrspace(4)* %27, align 4, !range !5, !invariant.load !6
  %29 = zext i16 %28 to i32
  %30 = icmp slt i32 %24, %2
  br i1 %30, label %31, label %58

31:                                               ; preds = %9
  %32 = icmp slt i32 %1, 1
  %33 = icmp eq i32 %4, 0
  %34 = select i1 %32, i1 true, i1 %33
  %35 = icmp slt i32 %4, 1
  %36 = add i32 %4, -1
  %37 = and i32 %4, 7
  %38 = icmp ult i32 %36, 7
  %39 = and i32 %4, -8
  %40 = icmp eq i32 %37, 0
  br label %41

41:                                               ; preds = %31, %168
  %42 = phi i32 [ %24, %31 ], [ %172, %168 ]
  br i1 %34, label %168, label %43

43:                                               ; preds = %41
  %44 = mul nsw i32 %42, 3
  %45 = zext i32 %44 to i64
  %46 = getelementptr inbounds float, float addrspace(1)* %18, i64 %45
  %47 = load float, float addrspace(1)* %46, align 4, !tbaa !7, !amdgpu.noclobber !6
  %48 = add nuw nsw i32 %44, 1
  %49 = zext i32 %48 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %18, i64 %49
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !7, !amdgpu.noclobber !6
  %52 = add nuw nsw i32 %44, 2
  %53 = zext i32 %52 to i64
  %54 = getelementptr inbounds float, float addrspace(1)* %18, i64 %53
  %55 = load float, float addrspace(1)* %54, align 4, !tbaa !7, !amdgpu.noclobber !6
  %56 = load float, float addrspace(1)* %3, align 4, !tbaa !7, !amdgpu.noclobber !6
  %57 = mul nsw i32 %42, %4
  br label %59

58:                                               ; preds = %168, %9
  ret void

59:                                               ; preds = %43, %162
  %60 = phi i32 [ 0, %43 ], [ %163, %162 ]
  %61 = phi i32 [ 0, %43 ], [ %164, %162 ]
  %62 = mul nuw nsw i32 %61, 3
  %63 = zext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %14, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !7, !amdgpu.noclobber !6
  %66 = add nuw nsw i32 %62, 1
  %67 = zext i32 %66 to i64
  %68 = getelementptr inbounds float, float addrspace(1)* %14, i64 %67
  %69 = load float, float addrspace(1)* %68, align 4, !tbaa !7, !amdgpu.noclobber !6
  %70 = add nuw nsw i32 %62, 2
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %14, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !7, !amdgpu.noclobber !6
  %74 = fsub contract float %47, %65
  %75 = fmul contract float %74, %74
  %76 = fsub contract float %51, %69
  %77 = fmul contract float %76, %76
  %78 = fadd contract float %75, %77
  %79 = fsub contract float %55, %73
  %80 = fmul contract float %79, %79
  %81 = fadd contract float %78, %80
  %82 = fcmp olt float %81, 0x39F0000000000000
  %83 = select i1 %82, float 0x41F0000000000000, float 1.000000e+00
  %84 = fmul float %81, %83
  %85 = tail call float @llvm.sqrt.f32(float %84)
  %86 = bitcast float %85 to i32
  %87 = add nsw i32 %86, -1
  %88 = bitcast i32 %87 to float
  %89 = add nsw i32 %86, 1
  %90 = bitcast i32 %89 to float
  %91 = tail call i1 @llvm.amdgcn.class.f32(float %84, i32 608)
  %92 = select i1 %82, float 0x3EF0000000000000, float 1.000000e+00
  %93 = fneg float %90
  %94 = tail call float @llvm.fma.f32(float %93, float %85, float %84)
  %95 = fcmp ogt float %94, 0.000000e+00
  %96 = fneg float %88
  %97 = tail call float @llvm.fma.f32(float %96, float %85, float %84)
  %98 = fcmp ole float %97, 0.000000e+00
  %99 = select i1 %98, float %88, float %85
  %100 = select i1 %95, float %90, float %99
  %101 = fmul float %92, %100
  %102 = select i1 %91, float %84, float %101
  %103 = tail call float @llvm.maxnum.f32(float %102, float 0x3BC79CA100000000)
  %104 = fcmp contract olt float %103, %56
  br i1 %104, label %105, label %162

105:                                              ; preds = %59
  %106 = icmp ne i32 %60, 0
  %107 = select i1 %106, i1 true, i1 %35
  br i1 %107, label %157, label %108

108:                                              ; preds = %105
  br i1 %38, label %146, label %109

109:                                              ; preds = %108, %109
  %110 = phi i32 [ %143, %109 ], [ 0, %108 ]
  %111 = phi i32 [ %144, %109 ], [ 0, %108 ]
  %112 = add nsw i32 %110, %57
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %113
  store i32 %61, i32 addrspace(1)* %114, align 4, !tbaa !11
  %115 = or i32 %110, 1
  %116 = add nsw i32 %115, %57
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %117
  store i32 %61, i32 addrspace(1)* %118, align 4, !tbaa !11
  %119 = or i32 %110, 2
  %120 = add nsw i32 %119, %57
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %121
  store i32 %61, i32 addrspace(1)* %122, align 4, !tbaa !11
  %123 = or i32 %110, 3
  %124 = add nsw i32 %123, %57
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %125
  store i32 %61, i32 addrspace(1)* %126, align 4, !tbaa !11
  %127 = or i32 %110, 4
  %128 = add nsw i32 %127, %57
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %129
  store i32 %61, i32 addrspace(1)* %130, align 4, !tbaa !11
  %131 = or i32 %110, 5
  %132 = add nsw i32 %131, %57
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %133
  store i32 %61, i32 addrspace(1)* %134, align 4, !tbaa !11
  %135 = or i32 %110, 6
  %136 = add nsw i32 %135, %57
  %137 = sext i32 %136 to i64
  %138 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %137
  store i32 %61, i32 addrspace(1)* %138, align 4, !tbaa !11
  %139 = or i32 %110, 7
  %140 = add nsw i32 %139, %57
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %141
  store i32 %61, i32 addrspace(1)* %142, align 4, !tbaa !11
  %143 = add nuw nsw i32 %110, 8
  %144 = add i32 %111, 8
  %145 = icmp eq i32 %144, %39
  br i1 %145, label %146, label %109, !llvm.loop !13

146:                                              ; preds = %109, %108
  %147 = phi i32 [ 0, %108 ], [ %143, %109 ]
  br i1 %40, label %157, label %148

148:                                              ; preds = %146, %148
  %149 = phi i32 [ %154, %148 ], [ %147, %146 ]
  %150 = phi i32 [ %155, %148 ], [ 0, %146 ]
  %151 = add nsw i32 %149, %57
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %152
  store i32 %61, i32 addrspace(1)* %153, align 4, !tbaa !11
  %154 = add nuw nsw i32 %149, 1
  %155 = add i32 %150, 1
  %156 = icmp eq i32 %155, %37
  br i1 %156, label %157, label %148, !llvm.loop !15

157:                                              ; preds = %146, %148, %105
  %158 = add nsw i32 %60, %57
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds i32, i32 addrspace(1)* %21, i64 %159
  store i32 %61, i32 addrspace(1)* %160, align 4, !tbaa !11
  %161 = add nsw i32 %60, 1
  br label %162

162:                                              ; preds = %157, %59
  %163 = phi i32 [ %161, %157 ], [ %60, %59 ]
  %164 = add nuw nsw i32 %61, 1
  %165 = icmp sge i32 %164, %1
  %166 = icmp eq i32 %163, %4
  %167 = select i1 %165, i1 true, i1 %166
  br i1 %167, label %168, label %59, !llvm.loop !17

168:                                              ; preds = %162, %41
  %169 = phi i32 [ 0, %41 ], [ %163, %162 ]
  %170 = zext i32 %42 to i64
  %171 = getelementptr inbounds i32, i32 addrspace(1)* %23, i64 %170
  store i32 %169, i32 addrspace(1)* %171, align 4, !tbaa !11
  %172 = add nuw nsw i32 %42, %29
  %173 = icmp slt i32 %172, %2
  br i1 %173, label %41, label %58, !llvm.loop !18
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

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!12, !12, i64 0}
!12 = !{!"int", !9, i64 0}
!13 = distinct !{!13, !14}
!14 = !{!"llvm.loop.mustprogress"}
!15 = distinct !{!15, !16}
!16 = !{!"llvm.loop.unroll.disable"}
!17 = distinct !{!17, !14}
!18 = distinct !{!18, !14}
