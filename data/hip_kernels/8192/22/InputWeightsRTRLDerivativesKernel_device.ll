; ModuleID = '../data/hip_kernels/8192/22/main.cu'
source_filename = "../data/hip_kernels/8192/22/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@D_INPUT_UNITS = protected addrspace(4) externally_initialized global i32 0, align 4
@D_HIDDEN_UNITS = protected addrspace(4) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_HIDDEN_UNITS to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_INPUT_UNITS to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z33InputWeightsRTRLDerivativesKernelPfS_S_S_S_(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3, float addrspace(1)* nocapture readonly %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %15
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %14
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %22
  %26 = load i32, i32 addrspace(4)* @D_HIDDEN_UNITS, align 4, !tbaa !16
  %27 = load i32, i32 addrspace(4)* @D_INPUT_UNITS, align 4, !tbaa !16
  %28 = mul i32 %27, %26
  %29 = mul i32 %28, %26
  %30 = icmp slt i32 %25, %29
  br i1 %30, label %31, label %188

31:                                               ; preds = %5
  %32 = freeze i32 %25
  %33 = freeze i32 %28
  %34 = sdiv i32 %32, %33
  %35 = mul i32 %34, %33
  %36 = sub i32 %32, %35
  %37 = freeze i32 %27
  %38 = sdiv i32 %36, %37
  %39 = mul i32 %38, %37
  %40 = sub i32 %36, %39
  %41 = icmp sgt i32 %26, 0
  br i1 %41, label %42, label %71

42:                                               ; preds = %31
  %43 = mul nsw i32 %34, %26
  %44 = and i32 %26, 7
  %45 = icmp ult i32 %26, 8
  br i1 %45, label %48, label %46

46:                                               ; preds = %42
  %47 = and i32 %26, -8
  br label %86

48:                                               ; preds = %86, %42
  %49 = phi float [ undef, %42 ], [ %184, %86 ]
  %50 = phi i32 [ 0, %42 ], [ %185, %86 ]
  %51 = phi float [ 0.000000e+00, %42 ], [ %184, %86 ]
  %52 = icmp eq i32 %44, 0
  br i1 %52, label %71, label %53

53:                                               ; preds = %48, %53
  %54 = phi i32 [ %68, %53 ], [ %50, %48 ]
  %55 = phi float [ %67, %53 ], [ %51, %48 ]
  %56 = phi i32 [ %69, %53 ], [ 0, %48 ]
  %57 = add nsw i32 %54, %43
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %2, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !20, !amdgpu.noclobber !5
  %61 = mul nsw i32 %54, %28
  %62 = add nsw i32 %61, %36
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds float, float addrspace(1)* %4, i64 %63
  %65 = load float, float addrspace(1)* %64, align 4, !tbaa !20, !amdgpu.noclobber !5
  %66 = fmul contract float %60, %65
  %67 = fadd contract float %55, %66
  %68 = add nuw nsw i32 %54, 1
  %69 = add i32 %56, 1
  %70 = icmp eq i32 %69, %44
  br i1 %70, label %71, label %53, !llvm.loop !22

71:                                               ; preds = %48, %53, %31
  %72 = phi float [ 0.000000e+00, %31 ], [ %49, %48 ], [ %67, %53 ]
  %73 = sext i32 %34 to i64
  %74 = getelementptr inbounds float, float addrspace(1)* %1, i64 %73
  %75 = load float, float addrspace(1)* %74, align 4, !tbaa !20, !amdgpu.noclobber !5
  %76 = icmp eq i32 %34, %38
  %77 = uitofp i1 %76 to float
  %78 = sext i32 %40 to i64
  %79 = getelementptr inbounds float, float addrspace(1)* %0, i64 %78
  %80 = load float, float addrspace(1)* %79, align 4, !tbaa !20, !amdgpu.noclobber !5
  %81 = fmul contract float %80, %77
  %82 = fadd contract float %72, %81
  %83 = fmul contract float %75, %82
  %84 = sext i32 %25 to i64
  %85 = getelementptr inbounds float, float addrspace(1)* %3, i64 %84
  store float %83, float addrspace(1)* %85, align 4, !tbaa !20
  br label %188

86:                                               ; preds = %86, %46
  %87 = phi i32 [ 0, %46 ], [ %185, %86 ]
  %88 = phi float [ 0.000000e+00, %46 ], [ %184, %86 ]
  %89 = phi i32 [ 0, %46 ], [ %186, %86 ]
  %90 = add nsw i32 %87, %43
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %2, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !20, !amdgpu.noclobber !5
  %94 = mul nsw i32 %87, %28
  %95 = add nsw i32 %94, %36
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds float, float addrspace(1)* %4, i64 %96
  %98 = load float, float addrspace(1)* %97, align 4, !tbaa !20, !amdgpu.noclobber !5
  %99 = fmul contract float %93, %98
  %100 = fadd contract float %88, %99
  %101 = or i32 %87, 1
  %102 = add nsw i32 %101, %43
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds float, float addrspace(1)* %2, i64 %103
  %105 = load float, float addrspace(1)* %104, align 4, !tbaa !20, !amdgpu.noclobber !5
  %106 = mul nsw i32 %101, %28
  %107 = add nsw i32 %106, %36
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds float, float addrspace(1)* %4, i64 %108
  %110 = load float, float addrspace(1)* %109, align 4, !tbaa !20, !amdgpu.noclobber !5
  %111 = fmul contract float %105, %110
  %112 = fadd contract float %100, %111
  %113 = or i32 %87, 2
  %114 = add nsw i32 %113, %43
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds float, float addrspace(1)* %2, i64 %115
  %117 = load float, float addrspace(1)* %116, align 4, !tbaa !20, !amdgpu.noclobber !5
  %118 = mul nsw i32 %113, %28
  %119 = add nsw i32 %118, %36
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds float, float addrspace(1)* %4, i64 %120
  %122 = load float, float addrspace(1)* %121, align 4, !tbaa !20, !amdgpu.noclobber !5
  %123 = fmul contract float %117, %122
  %124 = fadd contract float %112, %123
  %125 = or i32 %87, 3
  %126 = add nsw i32 %125, %43
  %127 = sext i32 %126 to i64
  %128 = getelementptr inbounds float, float addrspace(1)* %2, i64 %127
  %129 = load float, float addrspace(1)* %128, align 4, !tbaa !20, !amdgpu.noclobber !5
  %130 = mul nsw i32 %125, %28
  %131 = add nsw i32 %130, %36
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds float, float addrspace(1)* %4, i64 %132
  %134 = load float, float addrspace(1)* %133, align 4, !tbaa !20, !amdgpu.noclobber !5
  %135 = fmul contract float %129, %134
  %136 = fadd contract float %124, %135
  %137 = or i32 %87, 4
  %138 = add nsw i32 %137, %43
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds float, float addrspace(1)* %2, i64 %139
  %141 = load float, float addrspace(1)* %140, align 4, !tbaa !20, !amdgpu.noclobber !5
  %142 = mul nsw i32 %137, %28
  %143 = add nsw i32 %142, %36
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds float, float addrspace(1)* %4, i64 %144
  %146 = load float, float addrspace(1)* %145, align 4, !tbaa !20, !amdgpu.noclobber !5
  %147 = fmul contract float %141, %146
  %148 = fadd contract float %136, %147
  %149 = or i32 %87, 5
  %150 = add nsw i32 %149, %43
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds float, float addrspace(1)* %2, i64 %151
  %153 = load float, float addrspace(1)* %152, align 4, !tbaa !20, !amdgpu.noclobber !5
  %154 = mul nsw i32 %149, %28
  %155 = add nsw i32 %154, %36
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds float, float addrspace(1)* %4, i64 %156
  %158 = load float, float addrspace(1)* %157, align 4, !tbaa !20, !amdgpu.noclobber !5
  %159 = fmul contract float %153, %158
  %160 = fadd contract float %148, %159
  %161 = or i32 %87, 6
  %162 = add nsw i32 %161, %43
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds float, float addrspace(1)* %2, i64 %163
  %165 = load float, float addrspace(1)* %164, align 4, !tbaa !20, !amdgpu.noclobber !5
  %166 = mul nsw i32 %161, %28
  %167 = add nsw i32 %166, %36
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %4, i64 %168
  %170 = load float, float addrspace(1)* %169, align 4, !tbaa !20, !amdgpu.noclobber !5
  %171 = fmul contract float %165, %170
  %172 = fadd contract float %160, %171
  %173 = or i32 %87, 7
  %174 = add nsw i32 %173, %43
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %2, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !20, !amdgpu.noclobber !5
  %178 = mul nsw i32 %173, %28
  %179 = add nsw i32 %178, %36
  %180 = sext i32 %179 to i64
  %181 = getelementptr inbounds float, float addrspace(1)* %4, i64 %180
  %182 = load float, float addrspace(1)* %181, align 4, !tbaa !20, !amdgpu.noclobber !5
  %183 = fmul contract float %177, %182
  %184 = fadd contract float %172, %183
  %185 = add nuw nsw i32 %87, 8
  %186 = add i32 %89, 8
  %187 = icmp eq i32 %186, %47
  br i1 %187, label %48, label %86, !llvm.loop !24

188:                                              ; preds = %71, %5
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"int", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{!21, !21, i64 0}
!21 = !{!"float", !18, i64 0}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.unroll.disable"}
!24 = distinct !{!24, !25}
!25 = !{!"llvm.loop.mustprogress"}
