; ModuleID = '../data/hip_kernels/930/24/main.cu'
source_filename = "../data/hip_kernels/930/24/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@patch_data_char = external hidden local_unnamed_addr addrspace(3) global [0 x i8], align 1
@_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum = internal unnamed_addr addrspace(3) global [32 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_Pf(i32 %0, i32 %1, i32 %2, i32 %3, i32 %4, i32 %5, i32 %6, i32 %7, i32 %8, i32 %9, i32 %10, i32 %11, i32 %12, i32 %13, i32 %14, i32 %15, float addrspace(1)* nocapture readonly %16, float addrspace(1)* nocapture readonly %17, float addrspace(1)* nocapture writeonly %18) local_unnamed_addr #0 {
  %20 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %21 = mul i32 %20, %11
  %22 = add i32 %21, %6
  %23 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %24 = mul i32 %23, %11
  %25 = add i32 %24, %6
  %26 = tail call i32 @llvm.amdgcn.workgroup.id.z()
  %27 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %28 = icmp sgt i32 %10, 0
  br i1 %28, label %29, label %39

29:                                               ; preds = %19
  %30 = icmp slt i32 %27, %15
  %31 = mul nsw i32 %26, %14
  %32 = add nsw i32 %31, %25
  br label %33

33:                                               ; preds = %29, %52
  %34 = phi i32 [ 0, %29 ], [ %53, %52 ]
  %35 = mul nsw i32 %34, %10
  %36 = add nsw i32 %32, %34
  %37 = mul nsw i32 %36, %13
  %38 = add nsw i32 %37, %22
  br label %55

39:                                               ; preds = %52, %19
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %40 = icmp sgt i32 %4, 0
  br i1 %40, label %41, label %75

41:                                               ; preds = %39
  %42 = getelementptr inbounds [32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 %27
  %43 = icmp slt i32 %27, %15
  %44 = mul nsw i32 %26, %14
  %45 = add i32 %44, %25
  %46 = icmp eq i32 %27, 0
  %47 = mul nsw i32 %10, %10
  %48 = mul nsw i32 %47, %15
  %49 = sitofp i32 %48 to float
  %50 = mul nsw i32 %26, %5
  %51 = add i32 %50, %20
  br label %76

52:                                               ; preds = %62
  %53 = add nuw nsw i32 %34, 1
  %54 = icmp eq i32 %53, %10
  br i1 %54, label %39, label %33, !llvm.loop !5

55:                                               ; preds = %33, %62
  %56 = phi i32 [ 0, %33 ], [ %63, %62 ]
  %57 = add nsw i32 %56, %35
  %58 = mul nsw i32 %57, %15
  br i1 %30, label %59, label %62

59:                                               ; preds = %55
  %60 = add nsw i32 %38, %56
  %61 = mul nsw i32 %60, %15
  br label %65

62:                                               ; preds = %65, %55
  %63 = add nuw nsw i32 %56, 1
  %64 = icmp eq i32 %63, %10
  br i1 %64, label %52, label %55, !llvm.loop !7

65:                                               ; preds = %59, %65
  %66 = phi i32 [ %27, %59 ], [ %73, %65 ]
  %67 = add nsw i32 %66, %61
  %68 = add nsw i32 %66, %58
  %69 = sext i32 %67 to i64
  %70 = getelementptr inbounds float, float addrspace(1)* %16, i64 %69
  %71 = load float, float addrspace(1)* %70, align 4, !tbaa !8, !amdgpu.noclobber !12
  %72 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @patch_data_char to float addrspace(3)*), i32 %68
  store float %71, float addrspace(3)* %72, align 4, !tbaa !8
  %73 = add nuw nsw i32 %66, 32
  %74 = icmp slt i32 %73, %15
  br i1 %74, label %65, label %62, !llvm.loop !13

75:                                               ; preds = %200, %39
  ret void

76:                                               ; preds = %41, %200
  %77 = phi i32 [ 0, %41 ], [ %201, %200 ]
  store float 0.000000e+00, float addrspace(3)* %42, align 4, !tbaa !8
  br i1 %28, label %78, label %97

78:                                               ; preds = %76
  %79 = freeze i32 %77
  %80 = freeze i32 %8
  %81 = sdiv i32 %79, %80
  %82 = sub nsw i32 %81, %7
  %83 = mul nsw i32 %82, %12
  %84 = mul i32 %81, %80
  %85 = sub i32 %79, %84
  %86 = sub nsw i32 %85, %7
  %87 = mul nsw i32 %86, %12
  %88 = add nsw i32 %87, %22
  %89 = add i32 %45, %83
  br label %90

90:                                               ; preds = %78, %170
  %91 = phi float [ 0.000000e+00, %78 ], [ %183, %170 ]
  %92 = phi i32 [ 0, %78 ], [ %171, %170 ]
  %93 = mul nsw i32 %92, %10
  %94 = add i32 %89, %92
  %95 = mul nsw i32 %94, %13
  %96 = add nsw i32 %88, %95
  br label %173

97:                                               ; preds = %170, %76
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  br i1 %46, label %98, label %200

98:                                               ; preds = %97
  %99 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 0), align 16, !tbaa !8
  %100 = fadd contract float %99, 0.000000e+00
  %101 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 1), align 4, !tbaa !8
  %102 = fadd contract float %100, %101
  %103 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 2), align 8, !tbaa !8
  %104 = fadd contract float %102, %103
  %105 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 3), align 4, !tbaa !8
  %106 = fadd contract float %104, %105
  %107 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 4), align 16, !tbaa !8
  %108 = fadd contract float %106, %107
  %109 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 5), align 4, !tbaa !8
  %110 = fadd contract float %108, %109
  %111 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 6), align 8, !tbaa !8
  %112 = fadd contract float %110, %111
  %113 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 7), align 4, !tbaa !8
  %114 = fadd contract float %112, %113
  %115 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 8), align 16, !tbaa !8
  %116 = fadd contract float %114, %115
  %117 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 9), align 4, !tbaa !8
  %118 = fadd contract float %116, %117
  %119 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 10), align 8, !tbaa !8
  %120 = fadd contract float %118, %119
  %121 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 11), align 4, !tbaa !8
  %122 = fadd contract float %120, %121
  %123 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 12), align 16, !tbaa !8
  %124 = fadd contract float %122, %123
  %125 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 13), align 4, !tbaa !8
  %126 = fadd contract float %124, %125
  %127 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 14), align 8, !tbaa !8
  %128 = fadd contract float %126, %127
  %129 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 15), align 4, !tbaa !8
  %130 = fadd contract float %128, %129
  %131 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 16), align 16, !tbaa !8
  %132 = fadd contract float %130, %131
  %133 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 17), align 4, !tbaa !8
  %134 = fadd contract float %132, %133
  %135 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 18), align 8, !tbaa !8
  %136 = fadd contract float %134, %135
  %137 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 19), align 4, !tbaa !8
  %138 = fadd contract float %136, %137
  %139 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 20), align 16, !tbaa !8
  %140 = fadd contract float %138, %139
  %141 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 21), align 4, !tbaa !8
  %142 = fadd contract float %140, %141
  %143 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 22), align 8, !tbaa !8
  %144 = fadd contract float %142, %143
  %145 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 23), align 4, !tbaa !8
  %146 = fadd contract float %144, %145
  %147 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 24), align 16, !tbaa !8
  %148 = fadd contract float %146, %147
  %149 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 25), align 4, !tbaa !8
  %150 = fadd contract float %148, %149
  %151 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 26), align 8, !tbaa !8
  %152 = fadd contract float %150, %151
  %153 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 27), align 4, !tbaa !8
  %154 = fadd contract float %152, %153
  %155 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 28), align 16, !tbaa !8
  %156 = fadd contract float %154, %155
  %157 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 29), align 4, !tbaa !8
  %158 = fadd contract float %156, %157
  %159 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 30), align 8, !tbaa !8
  %160 = fadd contract float %158, %159
  %161 = load float, float addrspace(3)* getelementptr inbounds ([32 x float], [32 x float] addrspace(3)* @_ZZ13CorrelateDataiiiiiiiiiiiiiiiiPKfS0_PfE3sum, i32 0, i32 31), align 4, !tbaa !8
  %162 = fadd contract float %160, %161
  %163 = mul nsw i32 %77, %3
  %164 = add i32 %163, %23
  %165 = mul i32 %164, %2
  %166 = fdiv contract float %162, %49
  %167 = add i32 %51, %165
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds float, float addrspace(1)* %18, i64 %168
  store float %166, float addrspace(1)* %169, align 4, !tbaa !8
  br label %200

170:                                              ; preds = %182
  %171 = add nuw nsw i32 %92, 1
  %172 = icmp eq i32 %171, %10
  br i1 %172, label %97, label %90, !llvm.loop !14

173:                                              ; preds = %90, %182
  %174 = phi float [ %91, %90 ], [ %183, %182 ]
  %175 = phi i32 [ 0, %90 ], [ %184, %182 ]
  %176 = add nsw i32 %175, %93
  %177 = mul nsw i32 %176, %15
  br i1 %43, label %178, label %182

178:                                              ; preds = %173
  %179 = add nsw i32 %96, %175
  %180 = mul nsw i32 %179, %15
  br label %186

181:                                              ; preds = %186
  store float %197, float addrspace(3)* %42, align 4, !tbaa !8
  br label %182

182:                                              ; preds = %181, %173
  %183 = phi float [ %197, %181 ], [ %174, %173 ]
  %184 = add nuw nsw i32 %175, 1
  %185 = icmp eq i32 %184, %10
  br i1 %185, label %170, label %173, !llvm.loop !15

186:                                              ; preds = %178, %186
  %187 = phi float [ %174, %178 ], [ %197, %186 ]
  %188 = phi i32 [ %27, %178 ], [ %198, %186 ]
  %189 = add nsw i32 %188, %177
  %190 = add nsw i32 %188, %180
  %191 = getelementptr inbounds float, float addrspace(3)* bitcast ([0 x i8] addrspace(3)* @patch_data_char to float addrspace(3)*), i32 %189
  %192 = load float, float addrspace(3)* %191, align 4, !tbaa !8
  %193 = sext i32 %190 to i64
  %194 = getelementptr inbounds float, float addrspace(1)* %17, i64 %193
  %195 = load float, float addrspace(1)* %194, align 4, !tbaa !8
  %196 = fmul contract float %192, %195
  %197 = fadd contract float %187, %196
  %198 = add nuw nsw i32 %188, 32
  %199 = icmp slt i32 %198, %15
  br i1 %199, label %186, label %181, !llvm.loop !16

200:                                              ; preds = %98, %97
  %201 = add nuw nsw i32 %77, 1
  %202 = icmp eq i32 %201, %4
  br i1 %202, label %75, label %76, !llvm.loop !17
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.z() #2

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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.mustprogress"}
!7 = distinct !{!7, !6}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
!12 = !{}
!13 = distinct !{!13, !6}
!14 = distinct !{!14, !6}
!15 = distinct !{!15, !6}
!16 = distinct !{!16, !6}
!17 = distinct !{!17, !6}
