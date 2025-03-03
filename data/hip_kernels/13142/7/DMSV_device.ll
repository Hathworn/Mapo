; ModuleID = '../data/hip_kernels/13142/7/main.cu'
source_filename = "../data/hip_kernels/13142/7/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ4DMSVPfS_S_PiiE2Vs = internal unnamed_addr addrspace(3) global [16 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z4DMSVPfS_S_Pii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* %1, float addrspace(1)* nocapture writeonly %2, i32 addrspace(1)* nocapture readonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = icmp slt i32 %7, %4
  br i1 %8, label %9, label %185

9:                                                ; preds = %5
  %10 = addrspacecast float addrspace(1)* %1 to float*
  %11 = zext i32 %7 to i64
  %12 = getelementptr inbounds float, float addrspace(1)* %1, i64 %11
  %13 = load float, float addrspace(1)* %12, align 4, !tbaa !5, !amdgpu.noclobber !9
  %14 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %7
  store float %13, float addrspace(3)* %14, align 4, !tbaa !5
  %15 = add nuw nsw i32 %7, %4
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds float, float addrspace(1)* %1, i64 %16
  %18 = load float, float addrspace(1)* %17, align 4, !tbaa !5, !amdgpu.noclobber !9
  %19 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %15
  store float %18, float addrspace(3)* %19, align 4, !tbaa !5
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %20 = load i32, i32 addrspace(1)* %3, align 4, !tbaa !10, !amdgpu.noclobber !9
  %21 = ptrtoint float* %10 to i64
  %22 = trunc i64 %21 to i32
  %23 = sub i32 %20, %22
  %24 = icmp slt i32 %23, -3
  br i1 %24, label %25, label %28

25:                                               ; preds = %9
  %26 = shl nsw i32 %6, 5
  %27 = add nsw i32 %26, %7
  br label %62

28:                                               ; preds = %9
  %29 = sdiv i32 %23, 4
  %30 = shl nsw i32 %6, 5
  %31 = add i32 %30, %7
  %32 = add nsw i32 %29, 1
  %33 = and i32 %32, 7
  %34 = icmp ult i32 %29, 7
  br i1 %34, label %37, label %35

35:                                               ; preds = %28
  %36 = and i32 %32, -8
  br label %67

37:                                               ; preds = %67, %28
  %38 = phi float [ undef, %28 ], [ %181, %67 ]
  %39 = phi i32 [ 0, %28 ], [ %182, %67 ]
  %40 = phi float [ 0.000000e+00, %28 ], [ %181, %67 ]
  %41 = icmp eq i32 %33, 0
  br i1 %41, label %62, label %42

42:                                               ; preds = %37, %42
  %43 = phi i32 [ %59, %42 ], [ %39, %37 ]
  %44 = phi float [ %58, %42 ], [ %40, %37 ]
  %45 = phi i32 [ %60, %42 ], [ 0, %37 ]
  %46 = add nsw i32 %43, %4
  %47 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %46
  %48 = load float, float addrspace(3)* %47, align 4, !tbaa !5
  %49 = fptosi float %48 to i32
  %50 = mul nsw i32 %49, %4
  %51 = add i32 %31, %50
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds float, float addrspace(1)* %0, i64 %52
  %54 = load float, float addrspace(1)* %53, align 4, !tbaa !5, !amdgpu.noclobber !9
  %55 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %43
  %56 = load float, float addrspace(3)* %55, align 4, !tbaa !5
  %57 = fmul contract float %54, %56
  %58 = fadd contract float %44, %57
  %59 = add nuw nsw i32 %43, 1
  %60 = add i32 %45, 1
  %61 = icmp eq i32 %60, %33
  br i1 %61, label %62, label %42, !llvm.loop !12

62:                                               ; preds = %37, %42, %25
  %63 = phi i32 [ %27, %25 ], [ %31, %42 ], [ %31, %37 ]
  %64 = phi float [ 0.000000e+00, %25 ], [ %38, %37 ], [ %58, %42 ]
  %65 = sext i32 %63 to i64
  %66 = getelementptr inbounds float, float addrspace(1)* %2, i64 %65
  store float %64, float addrspace(1)* %66, align 4, !tbaa !5
  br label %185

67:                                               ; preds = %67, %35
  %68 = phi i32 [ 0, %35 ], [ %182, %67 ]
  %69 = phi float [ 0.000000e+00, %35 ], [ %181, %67 ]
  %70 = phi i32 [ 0, %35 ], [ %183, %67 ]
  %71 = add nsw i32 %68, %4
  %72 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %71
  %73 = load float, float addrspace(3)* %72, align 4, !tbaa !5
  %74 = fptosi float %73 to i32
  %75 = mul nsw i32 %74, %4
  %76 = add i32 %31, %75
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %77
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !5, !amdgpu.noclobber !9
  %80 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %68
  %81 = load float, float addrspace(3)* %80, align 16, !tbaa !5
  %82 = fmul contract float %79, %81
  %83 = fadd contract float %69, %82
  %84 = or i32 %68, 1
  %85 = add nsw i32 %84, %4
  %86 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %85
  %87 = load float, float addrspace(3)* %86, align 4, !tbaa !5
  %88 = fptosi float %87 to i32
  %89 = mul nsw i32 %88, %4
  %90 = add i32 %31, %89
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds float, float addrspace(1)* %0, i64 %91
  %93 = load float, float addrspace(1)* %92, align 4, !tbaa !5, !amdgpu.noclobber !9
  %94 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %84
  %95 = load float, float addrspace(3)* %94, align 4, !tbaa !5
  %96 = fmul contract float %93, %95
  %97 = fadd contract float %83, %96
  %98 = or i32 %68, 2
  %99 = add nsw i32 %98, %4
  %100 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %99
  %101 = load float, float addrspace(3)* %100, align 4, !tbaa !5
  %102 = fptosi float %101 to i32
  %103 = mul nsw i32 %102, %4
  %104 = add i32 %31, %103
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds float, float addrspace(1)* %0, i64 %105
  %107 = load float, float addrspace(1)* %106, align 4, !tbaa !5, !amdgpu.noclobber !9
  %108 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %98
  %109 = load float, float addrspace(3)* %108, align 8, !tbaa !5
  %110 = fmul contract float %107, %109
  %111 = fadd contract float %97, %110
  %112 = or i32 %68, 3
  %113 = add nsw i32 %112, %4
  %114 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %113
  %115 = load float, float addrspace(3)* %114, align 4, !tbaa !5
  %116 = fptosi float %115 to i32
  %117 = mul nsw i32 %116, %4
  %118 = add i32 %31, %117
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds float, float addrspace(1)* %0, i64 %119
  %121 = load float, float addrspace(1)* %120, align 4, !tbaa !5, !amdgpu.noclobber !9
  %122 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %112
  %123 = load float, float addrspace(3)* %122, align 4, !tbaa !5
  %124 = fmul contract float %121, %123
  %125 = fadd contract float %111, %124
  %126 = or i32 %68, 4
  %127 = add nsw i32 %126, %4
  %128 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %127
  %129 = load float, float addrspace(3)* %128, align 4, !tbaa !5
  %130 = fptosi float %129 to i32
  %131 = mul nsw i32 %130, %4
  %132 = add i32 %31, %131
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds float, float addrspace(1)* %0, i64 %133
  %135 = load float, float addrspace(1)* %134, align 4, !tbaa !5, !amdgpu.noclobber !9
  %136 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %126
  %137 = load float, float addrspace(3)* %136, align 16, !tbaa !5
  %138 = fmul contract float %135, %137
  %139 = fadd contract float %125, %138
  %140 = or i32 %68, 5
  %141 = add nsw i32 %140, %4
  %142 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %141
  %143 = load float, float addrspace(3)* %142, align 4, !tbaa !5
  %144 = fptosi float %143 to i32
  %145 = mul nsw i32 %144, %4
  %146 = add i32 %31, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds float, float addrspace(1)* %0, i64 %147
  %149 = load float, float addrspace(1)* %148, align 4, !tbaa !5, !amdgpu.noclobber !9
  %150 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %140
  %151 = load float, float addrspace(3)* %150, align 4, !tbaa !5
  %152 = fmul contract float %149, %151
  %153 = fadd contract float %139, %152
  %154 = or i32 %68, 6
  %155 = add nsw i32 %154, %4
  %156 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %155
  %157 = load float, float addrspace(3)* %156, align 4, !tbaa !5
  %158 = fptosi float %157 to i32
  %159 = mul nsw i32 %158, %4
  %160 = add i32 %31, %159
  %161 = sext i32 %160 to i64
  %162 = getelementptr inbounds float, float addrspace(1)* %0, i64 %161
  %163 = load float, float addrspace(1)* %162, align 4, !tbaa !5, !amdgpu.noclobber !9
  %164 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %154
  %165 = load float, float addrspace(3)* %164, align 8, !tbaa !5
  %166 = fmul contract float %163, %165
  %167 = fadd contract float %153, %166
  %168 = or i32 %68, 7
  %169 = add nsw i32 %168, %4
  %170 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %169
  %171 = load float, float addrspace(3)* %170, align 4, !tbaa !5
  %172 = fptosi float %171 to i32
  %173 = mul nsw i32 %172, %4
  %174 = add i32 %31, %173
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds float, float addrspace(1)* %0, i64 %175
  %177 = load float, float addrspace(1)* %176, align 4, !tbaa !5, !amdgpu.noclobber !9
  %178 = getelementptr inbounds [16 x float], [16 x float] addrspace(3)* @_ZZ4DMSVPfS_S_PiiE2Vs, i32 0, i32 %168
  %179 = load float, float addrspace(3)* %178, align 4, !tbaa !5
  %180 = fmul contract float %177, %179
  %181 = fadd contract float %167, %180
  %182 = add nuw nsw i32 %68, 8
  %183 = add i32 %70, 8
  %184 = icmp eq i32 %183, %36
  br i1 %184, label %37, label %67, !llvm.loop !14

185:                                              ; preds = %62, %5
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!5 = !{!6, !6, i64 0}
!6 = !{!"float", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.unroll.disable"}
!14 = distinct !{!14, !15}
!15 = !{!"llvm.loop.mustprogress"}
