; ModuleID = '../data/hip_kernels/12797/9/main.cu'
source_filename = "../data/hip_kernels/12797/9/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer = internal unnamed_addr addrspace(3) global [512 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiif(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture readonly %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, float %12) local_unnamed_addr #0 {
  %14 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %15 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %16 = getelementptr i8, i8 addrspace(4)* %15, i64 4
  %17 = bitcast i8 addrspace(4)* %16 to i16 addrspace(4)*
  %18 = load i16, i16 addrspace(4)* %17, align 4, !range !5, !invariant.load !6
  %19 = zext i16 %18 to i32
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul nsw i32 %20, %10
  %22 = mul nsw i32 %21, %6
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds float, float addrspace(1)* %3, i64 %23
  %25 = mul nsw i32 %20, %11
  %26 = mul nsw i32 %25, %7
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds float, float addrspace(1)* %2, i64 %27
  %29 = sext i32 %21 to i64
  %30 = getelementptr inbounds float, float addrspace(1)* %4, i64 %29
  %31 = sext i32 %25 to i64
  %32 = getelementptr inbounds float, float addrspace(1)* %5, i64 %31
  %33 = icmp sgt i32 %11, 0
  br i1 %33, label %34, label %45

34:                                               ; preds = %13
  %35 = icmp slt i32 %14, %7
  %36 = icmp sgt i32 %10, 0
  %37 = mul i32 %7, %6
  %38 = mul i32 %37, %8
  %39 = icmp slt i32 %14, %6
  %40 = icmp sgt i32 %7, 0
  %41 = and i32 %7, 7
  %42 = icmp ult i32 %7, 8
  %43 = and i32 %7, -8
  %44 = icmp eq i32 %41, 0
  br label %46

45:                                               ; preds = %192, %13
  ret void

46:                                               ; preds = %34, %192
  %47 = phi i32 [ 0, %34 ], [ %193, %192 ]
  %48 = zext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %32, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7
  %51 = fptosi float %50 to i32
  %52 = add nsw i32 %51, -1
  %53 = mul nsw i32 %47, %7
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %28, i64 %54
  %56 = mul nsw i32 %52, %7
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  br i1 %35, label %64, label %59

59:                                               ; preds = %64, %46
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %36, label %60, label %73

60:                                               ; preds = %59
  %61 = mul i32 %38, %52
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %0, i64 %62
  br label %74

64:                                               ; preds = %46, %64
  %65 = phi i32 [ %71, %64 ], [ %14, %46 ]
  %66 = zext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %55, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7
  %69 = fmul contract float %68, %12
  %70 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %65
  store float %69, float addrspace(3)* %70, align 4, !tbaa !7
  %71 = add nuw nsw i32 %65, %19
  %72 = icmp slt i32 %71, %7
  br i1 %72, label %64, label %59, !llvm.loop !11

73:                                               ; preds = %87, %59
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %35, label %195, label %192

74:                                               ; preds = %60, %87
  %75 = phi i32 [ 0, %60 ], [ %88, %87 ]
  %76 = zext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %30, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !7
  %79 = fptosi float %78 to i32
  %80 = add nsw i32 %79, -1
  %81 = mul nsw i32 %75, %6
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %24, i64 %82
  %84 = mul i32 %37, %80
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds float, float addrspace(1)* %63, i64 %85
  br i1 %39, label %90, label %87

87:                                               ; preds = %112, %74
  %88 = add nuw nsw i32 %75, 1
  %89 = icmp eq i32 %88, %10
  br i1 %89, label %73, label %74, !llvm.loop !13

90:                                               ; preds = %74, %112
  %91 = phi i32 [ %113, %112 ], [ %14, %74 ]
  %92 = zext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %83, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !7
  br i1 %40, label %95, label %112

95:                                               ; preds = %90
  br i1 %42, label %96, label %115

96:                                               ; preds = %115, %95
  %97 = phi i32 [ 0, %95 ], [ %189, %115 ]
  br i1 %44, label %112, label %98

98:                                               ; preds = %96, %98
  %99 = phi i32 [ %109, %98 ], [ %97, %96 ]
  %100 = phi i32 [ %110, %98 ], [ 0, %96 ]
  %101 = mul nsw i32 %99, %6
  %102 = add nsw i32 %101, %91
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %86, i64 %103
  %105 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %99
  %106 = load float, float addrspace(3)* %105, align 4, !tbaa !7
  %107 = fmul contract float %94, %106
  %108 = atomicrmw fadd float addrspace(1)* %104, float %107 syncscope("agent-one-as") monotonic, align 4
  %109 = add nuw nsw i32 %99, 1
  %110 = add i32 %100, 1
  %111 = icmp eq i32 %110, %41
  br i1 %111, label %112, label %98, !llvm.loop !14

112:                                              ; preds = %96, %98, %90
  %113 = add nuw nsw i32 %91, %19
  %114 = icmp slt i32 %113, %6
  br i1 %114, label %90, label %87, !llvm.loop !16

115:                                              ; preds = %95, %115
  %116 = phi i32 [ %189, %115 ], [ 0, %95 ]
  %117 = phi i32 [ %190, %115 ], [ 0, %95 ]
  %118 = mul nsw i32 %116, %6
  %119 = add nsw i32 %118, %91
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %86, i64 %120
  %122 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %116
  %123 = load float, float addrspace(3)* %122, align 16, !tbaa !7
  %124 = fmul contract float %94, %123
  %125 = atomicrmw fadd float addrspace(1)* %121, float %124 syncscope("agent-one-as") monotonic, align 4
  %126 = or i32 %116, 1
  %127 = mul nsw i32 %126, %6
  %128 = add nsw i32 %127, %91
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds float, float addrspace(1)* %86, i64 %129
  %131 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %126
  %132 = load float, float addrspace(3)* %131, align 4, !tbaa !7
  %133 = fmul contract float %94, %132
  %134 = atomicrmw fadd float addrspace(1)* %130, float %133 syncscope("agent-one-as") monotonic, align 4
  %135 = or i32 %116, 2
  %136 = mul nsw i32 %135, %6
  %137 = add nsw i32 %136, %91
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds float, float addrspace(1)* %86, i64 %138
  %140 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %135
  %141 = load float, float addrspace(3)* %140, align 8, !tbaa !7
  %142 = fmul contract float %94, %141
  %143 = atomicrmw fadd float addrspace(1)* %139, float %142 syncscope("agent-one-as") monotonic, align 4
  %144 = or i32 %116, 3
  %145 = mul nsw i32 %144, %6
  %146 = add nsw i32 %145, %91
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %86, i64 %147
  %149 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %144
  %150 = load float, float addrspace(3)* %149, align 4, !tbaa !7
  %151 = fmul contract float %94, %150
  %152 = atomicrmw fadd float addrspace(1)* %148, float %151 syncscope("agent-one-as") monotonic, align 4
  %153 = or i32 %116, 4
  %154 = mul nsw i32 %153, %6
  %155 = add nsw i32 %154, %91
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %86, i64 %156
  %158 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %153
  %159 = load float, float addrspace(3)* %158, align 16, !tbaa !7
  %160 = fmul contract float %94, %159
  %161 = atomicrmw fadd float addrspace(1)* %157, float %160 syncscope("agent-one-as") monotonic, align 4
  %162 = or i32 %116, 5
  %163 = mul nsw i32 %162, %6
  %164 = add nsw i32 %163, %91
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds float, float addrspace(1)* %86, i64 %165
  %167 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %162
  %168 = load float, float addrspace(3)* %167, align 4, !tbaa !7
  %169 = fmul contract float %94, %168
  %170 = atomicrmw fadd float addrspace(1)* %166, float %169 syncscope("agent-one-as") monotonic, align 4
  %171 = or i32 %116, 6
  %172 = mul nsw i32 %171, %6
  %173 = add nsw i32 %172, %91
  %174 = sext i32 %173 to i64
  %175 = getelementptr inbounds float, float addrspace(1)* %86, i64 %174
  %176 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %171
  %177 = load float, float addrspace(3)* %176, align 8, !tbaa !7
  %178 = fmul contract float %94, %177
  %179 = atomicrmw fadd float addrspace(1)* %175, float %178 syncscope("agent-one-as") monotonic, align 4
  %180 = or i32 %116, 7
  %181 = mul nsw i32 %180, %6
  %182 = add nsw i32 %181, %91
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds float, float addrspace(1)* %86, i64 %183
  %185 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %180
  %186 = load float, float addrspace(3)* %185, align 4, !tbaa !7
  %187 = fmul contract float %94, %186
  %188 = atomicrmw fadd float addrspace(1)* %184, float %187 syncscope("agent-one-as") monotonic, align 4
  %189 = add nuw nsw i32 %116, 8
  %190 = add i32 %117, 8
  %191 = icmp eq i32 %190, %43
  br i1 %191, label %96, label %115, !llvm.loop !17

192:                                              ; preds = %195, %73
  %193 = add nuw nsw i32 %47, 1
  %194 = icmp eq i32 %193, %11
  br i1 %194, label %45, label %46, !llvm.loop !18

195:                                              ; preds = %73, %195
  %196 = phi i32 [ %202, %195 ], [ %14, %73 ]
  %197 = zext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %58, i64 %197
  %199 = getelementptr inbounds [512 x float], [512 x float] addrspace(3)* @_ZZ42cunnx_BlockSparse_accGradParameters_kernelPfS_S_S_S_S_iiiiiifE16gradOutputBuffer, i32 0, i32 %196
  %200 = load float, float addrspace(3)* %199, align 4, !tbaa !7
  %201 = atomicrmw fadd float addrspace(1)* %198, float %200 syncscope("agent-one-as") monotonic, align 4
  %202 = add nuw nsw i32 %196, %19
  %203 = icmp slt i32 %202, %7
  br i1 %203, label %195, label %192, !llvm.loop !19
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

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
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.unroll.disable"}
!16 = distinct !{!16, !12}
!17 = distinct !{!17, !12}
!18 = distinct !{!18, !12}
!19 = distinct !{!19, !12}
