; ModuleID = '../data/hip_kernels/17379/4/main.cu'
source_filename = "../data/hip_kernels/17379/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ19SumaColMatrizKerneliiPfS_E3Nds = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z19SumaColMatrizKerneliiPfS_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture writeonly %3) local_unnamed_addr #0 {
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %8 = bitcast i8 addrspace(4)* %7 to i32 addrspace(4)*
  %9 = load i32, i32 addrspace(4)* %8, align 4, !tbaa !4
  %10 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !13, !invariant.load !14
  %13 = zext i16 %12 to i32
  %14 = udiv i32 %9, %13
  %15 = mul i32 %14, %13
  %16 = icmp ugt i32 %9, %15
  %17 = zext i1 %16 to i32
  %18 = add i32 %14, %17
  %19 = udiv i32 %1, %18
  %20 = mul i32 %19, %5
  %21 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %22 = add i32 %20, %21
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %24 = udiv i32 %0, %13
  %25 = mul nsw i32 %22, %0
  %26 = mul i32 %24, %21
  %27 = add i32 %25, %26
  %28 = icmp sgt i32 %24, 0
  br i1 %28, label %29, label %51

29:                                               ; preds = %4
  %30 = and i32 %24, 7
  %31 = icmp ult i32 %24, 8
  br i1 %31, label %34, label %32

32:                                               ; preds = %29
  %33 = and i32 %24, -8
  br label %65

34:                                               ; preds = %65, %29
  %35 = phi float [ undef, %29 ], [ %115, %65 ]
  %36 = phi i32 [ 0, %29 ], [ %116, %65 ]
  %37 = phi float [ 0.000000e+00, %29 ], [ %115, %65 ]
  %38 = icmp eq i32 %30, 0
  br i1 %38, label %51, label %39

39:                                               ; preds = %34, %39
  %40 = phi i32 [ %48, %39 ], [ %36, %34 ]
  %41 = phi float [ %47, %39 ], [ %37, %34 ]
  %42 = phi i32 [ %49, %39 ], [ 0, %34 ]
  %43 = add nsw i32 %27, %40
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds float, float addrspace(1)* %2, i64 %44
  %46 = load float, float addrspace(1)* %45, align 4, !tbaa !16, !amdgpu.noclobber !14
  %47 = fadd contract float %41, %46
  %48 = add nuw nsw i32 %40, 1
  %49 = add i32 %42, 1
  %50 = icmp eq i32 %49, %30
  br i1 %50, label %51, label %39, !llvm.loop !20

51:                                               ; preds = %34, %39, %4
  %52 = phi float [ 0.000000e+00, %4 ], [ %35, %34 ], [ %47, %39 ]
  %53 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %21
  store float %52, float addrspace(3)* %53, align 4, !tbaa !16
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp eq i32 %21, 0
  br i1 %54, label %55, label %180

55:                                               ; preds = %51
  %56 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 0), align 16, !tbaa !16
  %57 = icmp ugt i16 %12, 1
  br i1 %57, label %58, label %136

58:                                               ; preds = %55
  %59 = add nsw i32 %13, -1
  %60 = add nsw i32 %13, -2
  %61 = and i32 %59, 7
  %62 = icmp ult i32 %60, 7
  br i1 %62, label %119, label %63

63:                                               ; preds = %58
  %64 = and i32 %59, -8
  br label %142

65:                                               ; preds = %65, %32
  %66 = phi i32 [ 0, %32 ], [ %116, %65 ]
  %67 = phi float [ 0.000000e+00, %32 ], [ %115, %65 ]
  %68 = phi i32 [ 0, %32 ], [ %117, %65 ]
  %69 = add nsw i32 %27, %66
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds float, float addrspace(1)* %2, i64 %70
  %72 = load float, float addrspace(1)* %71, align 4, !tbaa !16, !amdgpu.noclobber !14
  %73 = fadd contract float %67, %72
  %74 = or i32 %66, 1
  %75 = add nsw i32 %27, %74
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds float, float addrspace(1)* %2, i64 %76
  %78 = load float, float addrspace(1)* %77, align 4, !tbaa !16, !amdgpu.noclobber !14
  %79 = fadd contract float %73, %78
  %80 = or i32 %66, 2
  %81 = add nsw i32 %27, %80
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds float, float addrspace(1)* %2, i64 %82
  %84 = load float, float addrspace(1)* %83, align 4, !tbaa !16, !amdgpu.noclobber !14
  %85 = fadd contract float %79, %84
  %86 = or i32 %66, 3
  %87 = add nsw i32 %27, %86
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds float, float addrspace(1)* %2, i64 %88
  %90 = load float, float addrspace(1)* %89, align 4, !tbaa !16, !amdgpu.noclobber !14
  %91 = fadd contract float %85, %90
  %92 = or i32 %66, 4
  %93 = add nsw i32 %27, %92
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds float, float addrspace(1)* %2, i64 %94
  %96 = load float, float addrspace(1)* %95, align 4, !tbaa !16, !amdgpu.noclobber !14
  %97 = fadd contract float %91, %96
  %98 = or i32 %66, 5
  %99 = add nsw i32 %27, %98
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds float, float addrspace(1)* %2, i64 %100
  %102 = load float, float addrspace(1)* %101, align 4, !tbaa !16, !amdgpu.noclobber !14
  %103 = fadd contract float %97, %102
  %104 = or i32 %66, 6
  %105 = add nsw i32 %27, %104
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds float, float addrspace(1)* %2, i64 %106
  %108 = load float, float addrspace(1)* %107, align 4, !tbaa !16, !amdgpu.noclobber !14
  %109 = fadd contract float %103, %108
  %110 = or i32 %66, 7
  %111 = add nsw i32 %27, %110
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds float, float addrspace(1)* %2, i64 %112
  %114 = load float, float addrspace(1)* %113, align 4, !tbaa !16, !amdgpu.noclobber !14
  %115 = fadd contract float %109, %114
  %116 = add nuw nsw i32 %66, 8
  %117 = add i32 %68, 8
  %118 = icmp eq i32 %117, %33
  br i1 %118, label %34, label %65, !llvm.loop !22

119:                                              ; preds = %142, %58
  %120 = phi float [ undef, %58 ], [ %176, %142 ]
  %121 = phi i32 [ 1, %58 ], [ %177, %142 ]
  %122 = phi float [ %56, %58 ], [ %176, %142 ]
  %123 = icmp eq i32 %61, 0
  br i1 %123, label %134, label %124

124:                                              ; preds = %119, %124
  %125 = phi i32 [ %131, %124 ], [ %121, %119 ]
  %126 = phi float [ %130, %124 ], [ %122, %119 ]
  %127 = phi i32 [ %132, %124 ], [ 0, %119 ]
  %128 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %125
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !16
  %130 = fadd contract float %126, %129
  %131 = add nuw nsw i32 %125, 1
  %132 = add i32 %127, 1
  %133 = icmp eq i32 %132, %61
  br i1 %133, label %134, label %124, !llvm.loop !24

134:                                              ; preds = %124, %119
  %135 = phi float [ %120, %119 ], [ %130, %124 ]
  store float %135, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 0), align 16, !tbaa !16
  br label %136

136:                                              ; preds = %134, %55
  %137 = phi float [ %135, %134 ], [ %56, %55 ]
  %138 = mul i32 %18, %22
  %139 = add i32 %138, %23
  %140 = zext i32 %139 to i64
  %141 = getelementptr inbounds float, float addrspace(1)* %3, i64 %140
  store float %137, float addrspace(1)* %141, align 4, !tbaa !16
  br label %180

142:                                              ; preds = %142, %63
  %143 = phi i32 [ 1, %63 ], [ %177, %142 ]
  %144 = phi float [ %56, %63 ], [ %176, %142 ]
  %145 = phi i32 [ 0, %63 ], [ %178, %142 ]
  %146 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %143
  %147 = load float, float addrspace(3)* %146, align 4, !tbaa !16
  %148 = fadd contract float %144, %147
  %149 = add nuw nsw i32 %143, 1
  %150 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %149
  %151 = load float, float addrspace(3)* %150, align 4, !tbaa !16
  %152 = fadd contract float %148, %151
  %153 = add nuw nsw i32 %143, 2
  %154 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %153
  %155 = load float, float addrspace(3)* %154, align 4, !tbaa !16
  %156 = fadd contract float %152, %155
  %157 = add nuw nsw i32 %143, 3
  %158 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %157
  %159 = load float, float addrspace(3)* %158, align 4, !tbaa !16
  %160 = fadd contract float %156, %159
  %161 = add nuw nsw i32 %143, 4
  %162 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %161
  %163 = load float, float addrspace(3)* %162, align 4, !tbaa !16
  %164 = fadd contract float %160, %163
  %165 = add nuw nsw i32 %143, 5
  %166 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %165
  %167 = load float, float addrspace(3)* %166, align 4, !tbaa !16
  %168 = fadd contract float %164, %167
  %169 = add nuw nsw i32 %143, 6
  %170 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %169
  %171 = load float, float addrspace(3)* %170, align 4, !tbaa !16
  %172 = fadd contract float %168, %171
  %173 = add nuw nsw i32 %143, 7
  %174 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ19SumaColMatrizKerneliiPfS_E3Nds, i32 0, i32 %173
  %175 = load float, float addrspace(3)* %174, align 4, !tbaa !16
  %176 = fadd contract float %172, %175
  %177 = add nuw nsw i32 %143, 8
  %178 = add i32 %145, 8
  %179 = icmp eq i32 %178, %64
  br i1 %179, label %119, label %142, !llvm.loop !25

180:                                              ; preds = %136, %51
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!4 = !{!5, !9, i64 12}
!5 = !{!"hsa_kernel_dispatch_packet_s", !6, i64 0, !6, i64 2, !6, i64 4, !6, i64 6, !6, i64 8, !6, i64 10, !9, i64 12, !9, i64 16, !9, i64 20, !9, i64 24, !9, i64 28, !10, i64 32, !11, i64 40, !10, i64 48, !12, i64 56}
!6 = !{!"short", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C/C++ TBAA"}
!9 = !{!"int", !7, i64 0}
!10 = !{!"long", !7, i64 0}
!11 = !{!"any pointer", !7, i64 0}
!12 = !{!"hsa_signal_s", !10, i64 0}
!13 = !{i16 1, i16 1025}
!14 = !{}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
!22 = distinct !{!22, !23}
!23 = !{!"llvm.loop.mustprogress"}
!24 = distinct !{!24, !21}
!25 = distinct !{!25, !23}
