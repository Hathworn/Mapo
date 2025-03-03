; ModuleID = '../data/hip_kernels/12764/2/main.cu'
source_filename = "../data/hip_kernels/12764/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedX = internal unnamed_addr addrspace(3) global [128 x i8] undef, align 16
@_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedY = internal unnamed_addr addrspace(3) global [128 x i8] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiii(i8 addrspace(1)* nocapture readonly %0, i8 addrspace(1)* nocapture readonly %1, i32 %2, float addrspace(1)* nocapture readonly %3, i32 %4, i32 %5, i32 %6, float addrspace(1)* nocapture %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13) local_unnamed_addr #0 {
  %15 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %18 = getelementptr i8, i8 addrspace(4)* %17, i64 4
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 4, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %16, %21
  %23 = add i32 %22, %15
  %24 = sitofp i32 %2 to float
  %25 = fmul contract float %24, 7.812500e-03
  %26 = tail call float @llvm.ceil.f32(float %25)
  %27 = fptosi float %26 to i32
  %28 = uitofp i16 %20 to float
  %29 = fdiv contract float 1.280000e+02, %28
  %30 = tail call float @llvm.ceil.f32(float %29)
  %31 = fptosi float %30 to i32
  %32 = icmp slt i32 %23, %13
  br i1 %32, label %33, label %174

33:                                               ; preds = %14
  %34 = sext i32 %23 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %3, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = freeze i32 %23
  %38 = freeze i32 %12
  %39 = sdiv i32 %37, %38
  %40 = mul i32 %39, %38
  %41 = sub i32 %37, %40
  %42 = freeze i32 %4
  %43 = sdiv i32 %41, %42
  %44 = mul i32 %43, %42
  %45 = sub i32 %41, %44
  %46 = add nsw i32 %6, -1
  %47 = add nsw i32 %46, %8
  %48 = sub i32 %47, %39
  %49 = srem i32 %48, %11
  %50 = sdiv i32 %4, 2
  %51 = sub nsw i32 %50, %45
  %52 = sdiv i32 %5, 2
  %53 = sub nsw i32 %52, %43
  %54 = mul nsw i32 %49, %10
  %55 = icmp sgt i32 %27, 0
  br i1 %55, label %56, label %174

56:                                               ; preds = %33
  %57 = srem i32 %2, 128
  %58 = icmp sgt i32 %31, 0
  br label %87

59:                                               ; preds = %170, %116
  %60 = phi i32 [ 0, %116 ], [ %171, %170 ]
  %61 = icmp eq i32 %117, 0
  br i1 %61, label %85, label %62

62:                                               ; preds = %59
  %63 = getelementptr inbounds [128 x i8], [128 x i8] addrspace(3)* @_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedX, i32 0, i32 %60
  %64 = load i8, i8 addrspace(3)* %63, align 1, !tbaa !11
  %65 = zext i8 %64 to i32
  %66 = add nsw i32 %51, %65
  %67 = getelementptr inbounds [128 x i8], [128 x i8] addrspace(3)* @_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedY, i32 0, i32 %60
  %68 = load i8, i8 addrspace(3)* %67, align 1, !tbaa !11
  %69 = zext i8 %68 to i32
  %70 = add nsw i32 %53, %69
  %71 = icmp sgt i32 %66, -1
  br i1 %71, label %72, label %85

72:                                               ; preds = %62
  %73 = icmp slt i32 %66, %9
  %74 = icmp sgt i32 %70, -1
  %75 = select i1 %73, i1 %74, i1 false
  %76 = icmp slt i32 %70, %10
  %77 = select i1 %75, i1 %76, i1 false
  br i1 %77, label %78, label %85

78:                                               ; preds = %72
  %79 = add i32 %70, %54
  %80 = mul i32 %79, %9
  %81 = add nsw i32 %80, %66
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %7, i64 %82
  %84 = atomicrmw fadd float addrspace(1)* %83, float %36 syncscope("agent-one-as") monotonic, align 4
  br label %85

85:                                               ; preds = %59, %78, %72, %62, %113
  %86 = icmp eq i32 %91, %27
  br i1 %86, label %174, label %87, !llvm.loop !12

87:                                               ; preds = %56, %85
  %88 = phi i32 [ %15, %56 ], [ %114, %85 ]
  %89 = phi i32 [ 128, %56 ], [ %93, %85 ]
  %90 = phi i32 [ 0, %56 ], [ %91, %85 ]
  %91 = add nuw nsw i32 %90, 1
  %92 = icmp eq i32 %91, %27
  %93 = select i1 %92, i32 %57, i32 %89
  %94 = icmp slt i32 %15, %93
  %95 = select i1 %58, i1 %94, i1 false
  br i1 %95, label %96, label %113

96:                                               ; preds = %87, %96
  %97 = phi i32 [ %108, %96 ], [ %88, %87 ]
  %98 = phi i32 [ %109, %96 ], [ 0, %87 ]
  %99 = phi i32 [ %107, %96 ], [ %15, %87 ]
  %100 = sext i32 %97 to i64
  %101 = getelementptr inbounds i8, i8 addrspace(1)* %0, i64 %100
  %102 = load i8, i8 addrspace(1)* %101, align 1, !tbaa !11
  %103 = getelementptr inbounds [128 x i8], [128 x i8] addrspace(3)* @_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedX, i32 0, i32 %99
  store i8 %102, i8 addrspace(3)* %103, align 1, !tbaa !11
  %104 = getelementptr inbounds i8, i8 addrspace(1)* %1, i64 %100
  %105 = load i8, i8 addrspace(1)* %104, align 1, !tbaa !11
  %106 = getelementptr inbounds [128 x i8], [128 x i8] addrspace(3)* @_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedY, i32 0, i32 %99
  store i8 %105, i8 addrspace(3)* %106, align 1, !tbaa !11
  %107 = add i32 %99, %21
  %108 = add i32 %97, %21
  %109 = add nuw nsw i32 %98, 1
  %110 = icmp slt i32 %109, %31
  %111 = icmp slt i32 %107, %93
  %112 = select i1 %110, i1 %111, i1 false
  br i1 %112, label %96, label %113, !llvm.loop !14

113:                                              ; preds = %96, %87
  %114 = phi i32 [ %88, %87 ], [ %108, %96 ]
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %115 = icmp sgt i32 %93, 0
  br i1 %115, label %116, label %85

116:                                              ; preds = %113
  %117 = and i32 %93, 1
  %118 = icmp eq i32 %93, 1
  br i1 %118, label %59, label %119

119:                                              ; preds = %116
  %120 = and i32 %93, -2
  br label %121

121:                                              ; preds = %170, %119
  %122 = phi i32 [ 0, %119 ], [ %171, %170 ]
  %123 = phi i32 [ 0, %119 ], [ %172, %170 ]
  %124 = getelementptr inbounds [128 x i8], [128 x i8] addrspace(3)* @_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedX, i32 0, i32 %122
  %125 = load i8, i8 addrspace(3)* %124, align 2, !tbaa !11
  %126 = zext i8 %125 to i32
  %127 = add nsw i32 %51, %126
  %128 = getelementptr inbounds [128 x i8], [128 x i8] addrspace(3)* @_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedY, i32 0, i32 %122
  %129 = load i8, i8 addrspace(3)* %128, align 2, !tbaa !11
  %130 = zext i8 %129 to i32
  %131 = add nsw i32 %53, %130
  %132 = icmp sgt i32 %127, -1
  br i1 %132, label %133, label %146

133:                                              ; preds = %121
  %134 = icmp slt i32 %127, %9
  %135 = icmp sgt i32 %131, -1
  %136 = select i1 %134, i1 %135, i1 false
  %137 = icmp slt i32 %131, %10
  %138 = select i1 %136, i1 %137, i1 false
  br i1 %138, label %139, label %146

139:                                              ; preds = %133
  %140 = add i32 %131, %54
  %141 = mul i32 %140, %9
  %142 = add nsw i32 %141, %127
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds float, float addrspace(1)* %7, i64 %143
  %145 = atomicrmw fadd float addrspace(1)* %144, float %36 syncscope("agent-one-as") monotonic, align 4
  br label %146

146:                                              ; preds = %139, %133, %121
  %147 = or i32 %122, 1
  %148 = getelementptr inbounds [128 x i8], [128 x i8] addrspace(3)* @_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedX, i32 0, i32 %147
  %149 = load i8, i8 addrspace(3)* %148, align 1, !tbaa !11
  %150 = zext i8 %149 to i32
  %151 = add nsw i32 %51, %150
  %152 = getelementptr inbounds [128 x i8], [128 x i8] addrspace(3)* @_ZZ29kernelProcessEventsBatchAsyncPhS_iPfiiiS0_iiiiiiE19gpuEventListSharedY, i32 0, i32 %147
  %153 = load i8, i8 addrspace(3)* %152, align 1, !tbaa !11
  %154 = zext i8 %153 to i32
  %155 = add nsw i32 %53, %154
  %156 = icmp sgt i32 %151, -1
  br i1 %156, label %157, label %170

157:                                              ; preds = %146
  %158 = icmp slt i32 %151, %9
  %159 = icmp sgt i32 %155, -1
  %160 = select i1 %158, i1 %159, i1 false
  %161 = icmp slt i32 %155, %10
  %162 = select i1 %160, i1 %161, i1 false
  br i1 %162, label %163, label %170

163:                                              ; preds = %157
  %164 = add i32 %155, %54
  %165 = mul i32 %164, %9
  %166 = add nsw i32 %165, %151
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds float, float addrspace(1)* %7, i64 %167
  %169 = atomicrmw fadd float addrspace(1)* %168, float %36 syncscope("agent-one-as") monotonic, align 4
  br label %170

170:                                              ; preds = %163, %157, %146
  %171 = add nuw nsw i32 %122, 2
  %172 = add i32 %123, 2
  %173 = icmp eq i32 %172, %120
  br i1 %173, label %59, label %121, !llvm.loop !15

174:                                              ; preds = %85, %33, %14
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.ceil.f32(float) #2

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
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{!9, !9, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13}
