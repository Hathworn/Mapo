; ModuleID = '../data/hip_kernels/8192/59/main.cu'
source_filename = "../data/hip_kernels/8192/59/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@D_HIDDEN_UNITS = protected addrspace(4) externally_initialized global i32 0, align 4
@D_OUTPUT_UNITS = protected addrspace(4) externally_initialized global i32 0, align 4
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_HIDDEN_UNITS to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @D_OUTPUT_UNITS to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind
define protected amdgpu_kernel void @_Z28ChangeRecurrentWeightsKernelPfS_S_S_S_ff(float addrspace(1)* nocapture %0, float addrspace(1)* nocapture %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float %5, float %6) local_unnamed_addr #0 {
  %8 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %9 = getelementptr i8, i8 addrspace(4)* %8, i64 4
  %10 = bitcast i8 addrspace(4)* %9 to i16 addrspace(4)*
  %11 = load i16, i16 addrspace(4)* %10, align 4, !range !4, !invariant.load !5
  %12 = zext i16 %11 to i32
  %13 = getelementptr inbounds i8, i8 addrspace(4)* %8, i64 12
  %14 = bitcast i8 addrspace(4)* %13 to i32 addrspace(4)*
  %15 = load i32, i32 addrspace(4)* %14, align 4, !tbaa !6
  %16 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = udiv i32 %15, %12
  %19 = mul i32 %18, %12
  %20 = icmp ugt i32 %15, %19
  %21 = zext i1 %20 to i32
  %22 = add i32 %18, %21
  %23 = mul i32 %22, %17
  %24 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %25 = add i32 %23, %16
  %26 = mul i32 %25, %12
  %27 = add i32 %26, %24
  %28 = load i32, i32 addrspace(4)* @D_HIDDEN_UNITS, align 4, !tbaa !16
  %29 = mul i32 %28, %28
  %30 = icmp slt i32 %27, %29
  br i1 %30, label %31, label %189

31:                                               ; preds = %7
  %32 = load i32, i32 addrspace(4)* @D_OUTPUT_UNITS, align 4, !tbaa !16
  %33 = icmp sgt i32 %32, 0
  br i1 %33, label %34, label %45

34:                                               ; preds = %31
  %35 = icmp sgt i32 %28, 0
  %36 = and i32 %28, 7
  %37 = icmp ult i32 %28, 8
  %38 = and i32 %28, -8
  %39 = icmp eq i32 %36, 0
  br label %40

40:                                               ; preds = %34, %78
  %41 = phi float [ 0.000000e+00, %34 ], [ %84, %78 ]
  %42 = phi i32 [ 0, %34 ], [ %85, %78 ]
  br i1 %35, label %43, label %78

43:                                               ; preds = %40
  %44 = mul nsw i32 %42, %28
  br i1 %37, label %56, label %87

45:                                               ; preds = %78, %31
  %46 = phi float [ 0.000000e+00, %31 ], [ %84, %78 ]
  %47 = fmul contract float %46, %5
  %48 = sext i32 %27 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %1, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !20, !amdgpu.noclobber !5
  %51 = fmul contract float %50, %6
  %52 = fadd contract float %47, %51
  store float %52, float addrspace(1)* %49, align 4, !tbaa !20
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %48
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !20
  %55 = fadd contract float %54, %52
  store float %55, float addrspace(1)* %53, align 4, !tbaa !20
  br label %189

56:                                               ; preds = %87, %43
  %57 = phi float [ undef, %43 ], [ %185, %87 ]
  %58 = phi i32 [ 0, %43 ], [ %186, %87 ]
  %59 = phi float [ 0.000000e+00, %43 ], [ %185, %87 ]
  br i1 %39, label %78, label %60

60:                                               ; preds = %56, %60
  %61 = phi i32 [ %75, %60 ], [ %58, %56 ]
  %62 = phi float [ %74, %60 ], [ %59, %56 ]
  %63 = phi i32 [ %76, %60 ], [ 0, %56 ]
  %64 = add nsw i32 %61, %44
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  %67 = load float, float addrspace(1)* %66, align 4, !tbaa !20, !amdgpu.noclobber !5
  %68 = mul i32 %29, %61
  %69 = add nsw i32 %68, %27
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %4, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !20, !amdgpu.noclobber !5
  %73 = fmul contract float %67, %72
  %74 = fadd contract float %62, %73
  %75 = add nuw nsw i32 %61, 1
  %76 = add i32 %63, 1
  %77 = icmp eq i32 %76, %36
  br i1 %77, label %78, label %60, !llvm.loop !22

78:                                               ; preds = %56, %60, %40
  %79 = phi float [ 0.000000e+00, %40 ], [ %57, %56 ], [ %74, %60 ]
  %80 = zext i32 %42 to i64
  %81 = getelementptr inbounds float, float addrspace(1)* %3, i64 %80
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !20, !amdgpu.noclobber !5
  %83 = fmul contract float %79, %82
  %84 = fadd contract float %41, %83
  %85 = add nuw nsw i32 %42, 1
  %86 = icmp eq i32 %85, %32
  br i1 %86, label %45, label %40, !llvm.loop !24

87:                                               ; preds = %43, %87
  %88 = phi i32 [ %186, %87 ], [ 0, %43 ]
  %89 = phi float [ %185, %87 ], [ 0.000000e+00, %43 ]
  %90 = phi i32 [ %187, %87 ], [ 0, %43 ]
  %91 = add nsw i32 %88, %44
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %92
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !20, !amdgpu.noclobber !5
  %95 = mul i32 %29, %88
  %96 = add nsw i32 %95, %27
  %97 = sext i32 %96 to i64
  %98 = getelementptr inbounds float, float addrspace(1)* %4, i64 %97
  %99 = load float, float addrspace(1)* %98, align 4, !tbaa !20, !amdgpu.noclobber !5
  %100 = fmul contract float %94, %99
  %101 = fadd contract float %89, %100
  %102 = or i32 %88, 1
  %103 = add nsw i32 %102, %44
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds float, float addrspace(1)* %2, i64 %104
  %106 = load float, float addrspace(1)* %105, align 4, !tbaa !20, !amdgpu.noclobber !5
  %107 = mul i32 %29, %102
  %108 = add nsw i32 %107, %27
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds float, float addrspace(1)* %4, i64 %109
  %111 = load float, float addrspace(1)* %110, align 4, !tbaa !20, !amdgpu.noclobber !5
  %112 = fmul contract float %106, %111
  %113 = fadd contract float %101, %112
  %114 = or i32 %88, 2
  %115 = add nsw i32 %114, %44
  %116 = sext i32 %115 to i64
  %117 = getelementptr inbounds float, float addrspace(1)* %2, i64 %116
  %118 = load float, float addrspace(1)* %117, align 4, !tbaa !20, !amdgpu.noclobber !5
  %119 = mul i32 %29, %114
  %120 = add nsw i32 %119, %27
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds float, float addrspace(1)* %4, i64 %121
  %123 = load float, float addrspace(1)* %122, align 4, !tbaa !20, !amdgpu.noclobber !5
  %124 = fmul contract float %118, %123
  %125 = fadd contract float %113, %124
  %126 = or i32 %88, 3
  %127 = add nsw i32 %126, %44
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds float, float addrspace(1)* %2, i64 %128
  %130 = load float, float addrspace(1)* %129, align 4, !tbaa !20, !amdgpu.noclobber !5
  %131 = mul i32 %29, %126
  %132 = add nsw i32 %131, %27
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %4, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !20, !amdgpu.noclobber !5
  %136 = fmul contract float %130, %135
  %137 = fadd contract float %125, %136
  %138 = or i32 %88, 4
  %139 = add nsw i32 %138, %44
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %2, i64 %140
  %142 = load float, float addrspace(1)* %141, align 4, !tbaa !20, !amdgpu.noclobber !5
  %143 = mul i32 %29, %138
  %144 = add nsw i32 %143, %27
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds float, float addrspace(1)* %4, i64 %145
  %147 = load float, float addrspace(1)* %146, align 4, !tbaa !20, !amdgpu.noclobber !5
  %148 = fmul contract float %142, %147
  %149 = fadd contract float %137, %148
  %150 = or i32 %88, 5
  %151 = add nsw i32 %150, %44
  %152 = sext i32 %151 to i64
  %153 = getelementptr inbounds float, float addrspace(1)* %2, i64 %152
  %154 = load float, float addrspace(1)* %153, align 4, !tbaa !20, !amdgpu.noclobber !5
  %155 = mul i32 %29, %150
  %156 = add nsw i32 %155, %27
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds float, float addrspace(1)* %4, i64 %157
  %159 = load float, float addrspace(1)* %158, align 4, !tbaa !20, !amdgpu.noclobber !5
  %160 = fmul contract float %154, %159
  %161 = fadd contract float %149, %160
  %162 = or i32 %88, 6
  %163 = add nsw i32 %162, %44
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds float, float addrspace(1)* %2, i64 %164
  %166 = load float, float addrspace(1)* %165, align 4, !tbaa !20, !amdgpu.noclobber !5
  %167 = mul i32 %29, %162
  %168 = add nsw i32 %167, %27
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds float, float addrspace(1)* %4, i64 %169
  %171 = load float, float addrspace(1)* %170, align 4, !tbaa !20, !amdgpu.noclobber !5
  %172 = fmul contract float %166, %171
  %173 = fadd contract float %161, %172
  %174 = or i32 %88, 7
  %175 = add nsw i32 %174, %44
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds float, float addrspace(1)* %2, i64 %176
  %178 = load float, float addrspace(1)* %177, align 4, !tbaa !20, !amdgpu.noclobber !5
  %179 = mul i32 %29, %174
  %180 = add nsw i32 %179, %27
  %181 = sext i32 %180 to i64
  %182 = getelementptr inbounds float, float addrspace(1)* %4, i64 %181
  %183 = load float, float addrspace(1)* %182, align 4, !tbaa !20, !amdgpu.noclobber !5
  %184 = fmul contract float %178, %183
  %185 = fadd contract float %173, %184
  %186 = add nuw nsw i32 %88, 8
  %187 = add i32 %90, 8
  %188 = icmp eq i32 %187, %38
  br i1 %188, label %56, label %87, !llvm.loop !26

189:                                              ; preds = %45, %7
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
!26 = distinct !{!26, !25}
