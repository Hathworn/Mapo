; ModuleID = '../data/hip_kernels/1574/52/main.cu'
source_filename = "../data/hip_kernels/1574/52/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1 = internal unnamed_addr addrspace(3) global [2592 x float] undef, align 16
@_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2 = internal unnamed_addr addrspace(3) global [2592 x float] undef, align 16

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z11crossFilterPKdPKfS2_S2_Pf(double addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4) local_unnamed_addr #0 {
  %6 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %7 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %10 = getelementptr inbounds double, double addrspace(1)* %0, i64 1
  %11 = load double, double addrspace(1)* %10, align 8, !tbaa !5, !amdgpu.noclobber !9
  %12 = fptosi double %11 to i32
  %13 = getelementptr inbounds double, double addrspace(1)* %0, i64 9
  %14 = load double, double addrspace(1)* %13, align 8, !tbaa !5, !amdgpu.noclobber !9
  %15 = fptosi double %14 to i32
  %16 = shl nsw i32 %8, 5
  %17 = add nsw i32 %16, %6
  %18 = add nsw i32 %16, %7
  %19 = icmp slt i32 %18, %12
  %20 = icmp slt i32 %6, %15
  %21 = select i1 %19, i1 %20, i1 false
  br i1 %21, label %22, label %35

22:                                               ; preds = %5
  %23 = mul nsw i32 %18, %15
  %24 = mul nsw i32 %7, %15
  br label %25

25:                                               ; preds = %22, %25
  %26 = phi i32 [ %6, %22 ], [ %33, %25 ]
  %27 = add nsw i32 %26, %23
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !10, !amdgpu.noclobber !9
  %31 = add nsw i32 %26, %24
  %32 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %31
  store float %30, float addrspace(3)* %32, align 4, !tbaa !10
  %33 = add nuw nsw i32 %26, 32
  %34 = icmp slt i32 %33, %15
  br i1 %34, label %25, label %35, !llvm.loop !12

35:                                               ; preds = %25, %5
  %36 = shl nsw i32 %9, 5
  %37 = add nsw i32 %36, %7
  %38 = icmp slt i32 %37, %12
  %39 = select i1 %38, i1 %20, i1 false
  br i1 %39, label %40, label %53

40:                                               ; preds = %35
  %41 = mul nsw i32 %37, %15
  %42 = mul nsw i32 %7, %15
  br label %43

43:                                               ; preds = %40, %43
  %44 = phi i32 [ %6, %40 ], [ %51, %43 ]
  %45 = add nsw i32 %44, %41
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds float, float addrspace(1)* %2, i64 %46
  %48 = load float, float addrspace(1)* %47, align 4, !tbaa !10, !amdgpu.noclobber !9
  %49 = add nsw i32 %44, %42
  %50 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %49
  store float %48, float addrspace(3)* %50, align 4, !tbaa !10
  %51 = add nuw nsw i32 %44, 32
  %52 = icmp slt i32 %51, %15
  br i1 %52, label %43, label %53, !llvm.loop !14

53:                                               ; preds = %43, %35
  fence syncscope("workgroup") release
  tail call void @llvm.amdgcn.s.barrier()
  fence syncscope("workgroup") acquire
  %54 = icmp slt i32 %17, %12
  %55 = select i1 %38, i1 %54, i1 false
  %56 = icmp sgt i32 %15, 0
  %57 = select i1 %55, i1 %56, i1 false
  br i1 %57, label %58, label %213

58:                                               ; preds = %53
  %59 = shl nuw nsw i32 %15, 1
  %60 = add i32 %59, -1
  %61 = mul nsw i32 %6, %15
  %62 = mul nsw i32 %7, %15
  %63 = add i32 %62, %15
  %64 = add nsw i32 %15, -1
  %65 = add i32 %64, %62
  %66 = mul nsw i32 %37, %12
  %67 = add nsw i32 %66, %17
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds float, float addrspace(1)* %3, i64 %68
  %70 = mul i32 %12, %12
  %71 = tail call i32 @llvm.smax.i32(i32 %60, i32 1)
  br label %72

72:                                               ; preds = %58, %201
  %73 = phi i32 [ 1, %58 ], [ %211, %201 ]
  %74 = phi i32 [ 0, %58 ], [ %210, %201 ]
  %75 = phi i32 [ 0, %58 ], [ %209, %201 ]
  %76 = icmp slt i32 %75, %15
  br i1 %76, label %77, label %161

77:                                               ; preds = %72
  %78 = add i32 %65, %74
  %79 = and i32 %73, 7
  %80 = icmp ult i32 %75, 7
  br i1 %80, label %181, label %81

81:                                               ; preds = %77
  %82 = and i32 %73, -8
  br label %83

83:                                               ; preds = %83, %81
  %84 = phi float [ 0.000000e+00, %81 ], [ %157, %83 ]
  %85 = phi i32 [ 0, %81 ], [ %158, %83 ]
  %86 = phi i32 [ 0, %81 ], [ %159, %83 ]
  %87 = add nsw i32 %85, %61
  %88 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %87
  %89 = load float, float addrspace(3)* %88, align 4, !tbaa !10
  %90 = add i32 %78, %85
  %91 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %90
  %92 = load float, float addrspace(3)* %91, align 4, !tbaa !10
  %93 = fmul contract float %89, %92
  %94 = fadd contract float %84, %93
  %95 = or i32 %85, 1
  %96 = add nsw i32 %95, %61
  %97 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %96
  %98 = load float, float addrspace(3)* %97, align 4, !tbaa !10
  %99 = add i32 %78, %95
  %100 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %99
  %101 = load float, float addrspace(3)* %100, align 4, !tbaa !10
  %102 = fmul contract float %98, %101
  %103 = fadd contract float %94, %102
  %104 = or i32 %85, 2
  %105 = add nsw i32 %104, %61
  %106 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %105
  %107 = load float, float addrspace(3)* %106, align 4, !tbaa !10
  %108 = add i32 %78, %104
  %109 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %108
  %110 = load float, float addrspace(3)* %109, align 4, !tbaa !10
  %111 = fmul contract float %107, %110
  %112 = fadd contract float %103, %111
  %113 = or i32 %85, 3
  %114 = add nsw i32 %113, %61
  %115 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %114
  %116 = load float, float addrspace(3)* %115, align 4, !tbaa !10
  %117 = add i32 %78, %113
  %118 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %117
  %119 = load float, float addrspace(3)* %118, align 4, !tbaa !10
  %120 = fmul contract float %116, %119
  %121 = fadd contract float %112, %120
  %122 = or i32 %85, 4
  %123 = add nsw i32 %122, %61
  %124 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %123
  %125 = load float, float addrspace(3)* %124, align 4, !tbaa !10
  %126 = add i32 %78, %122
  %127 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %126
  %128 = load float, float addrspace(3)* %127, align 4, !tbaa !10
  %129 = fmul contract float %125, %128
  %130 = fadd contract float %121, %129
  %131 = or i32 %85, 5
  %132 = add nsw i32 %131, %61
  %133 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %132
  %134 = load float, float addrspace(3)* %133, align 4, !tbaa !10
  %135 = add i32 %78, %131
  %136 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %135
  %137 = load float, float addrspace(3)* %136, align 4, !tbaa !10
  %138 = fmul contract float %134, %137
  %139 = fadd contract float %130, %138
  %140 = or i32 %85, 6
  %141 = add nsw i32 %140, %61
  %142 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %141
  %143 = load float, float addrspace(3)* %142, align 4, !tbaa !10
  %144 = add i32 %78, %140
  %145 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %144
  %146 = load float, float addrspace(3)* %145, align 4, !tbaa !10
  %147 = fmul contract float %143, %146
  %148 = fadd contract float %139, %147
  %149 = or i32 %85, 7
  %150 = add nsw i32 %149, %61
  %151 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %150
  %152 = load float, float addrspace(3)* %151, align 4, !tbaa !10
  %153 = add i32 %78, %149
  %154 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %153
  %155 = load float, float addrspace(3)* %154, align 4, !tbaa !10
  %156 = fmul contract float %152, %155
  %157 = fadd contract float %148, %156
  %158 = add nuw nsw i32 %85, 8
  %159 = add i32 %86, 8
  %160 = icmp eq i32 %159, %82
  br i1 %160, label %181, label %83, !llvm.loop !15

161:                                              ; preds = %72
  %162 = sub nsw i32 %75, %15
  %163 = add nsw i32 %162, 1
  %164 = icmp slt i32 %163, %15
  br i1 %164, label %165, label %201

165:                                              ; preds = %161
  %166 = add i32 %63, %74
  br label %167

167:                                              ; preds = %165, %167
  %168 = phi i32 [ %163, %165 ], [ %179, %167 ]
  %169 = phi float [ 0.000000e+00, %165 ], [ %178, %167 ]
  %170 = phi i32 [ %162, %165 ], [ %168, %167 ]
  %171 = add nsw i32 %168, %61
  %172 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %171
  %173 = load float, float addrspace(3)* %172, align 4, !tbaa !10
  %174 = add i32 %166, %170
  %175 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %174
  %176 = load float, float addrspace(3)* %175, align 4, !tbaa !10
  %177 = fmul contract float %173, %176
  %178 = fadd contract float %169, %177
  %179 = add nsw i32 %168, 1
  %180 = icmp slt i32 %179, %15
  br i1 %180, label %167, label %201, !llvm.loop !16

181:                                              ; preds = %83, %77
  %182 = phi float [ undef, %77 ], [ %157, %83 ]
  %183 = phi float [ 0.000000e+00, %77 ], [ %157, %83 ]
  %184 = phi i32 [ 0, %77 ], [ %158, %83 ]
  %185 = icmp eq i32 %79, 0
  br i1 %185, label %201, label %186

186:                                              ; preds = %181, %186
  %187 = phi float [ %197, %186 ], [ %183, %181 ]
  %188 = phi i32 [ %198, %186 ], [ %184, %181 ]
  %189 = phi i32 [ %199, %186 ], [ 0, %181 ]
  %190 = add nsw i32 %188, %61
  %191 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW1, i32 0, i32 %190
  %192 = load float, float addrspace(3)* %191, align 4, !tbaa !10
  %193 = add i32 %78, %188
  %194 = getelementptr inbounds [2592 x float], [2592 x float] addrspace(3)* @_ZZ11crossFilterPKdPKfS2_S2_PfE4shW2, i32 0, i32 %193
  %195 = load float, float addrspace(3)* %194, align 4, !tbaa !10
  %196 = fmul contract float %192, %195
  %197 = fadd contract float %187, %196
  %198 = add nuw nsw i32 %188, 1
  %199 = add i32 %189, 1
  %200 = icmp eq i32 %199, %79
  br i1 %200, label %201, label %186, !llvm.loop !17

201:                                              ; preds = %167, %181, %186, %161
  %202 = phi float [ 0.000000e+00, %161 ], [ %182, %181 ], [ %197, %186 ], [ %178, %167 ]
  %203 = load float, float addrspace(1)* %69, align 4, !tbaa !10
  %204 = fmul contract float %202, %203
  %205 = mul i32 %70, %75
  %206 = add nsw i32 %205, %67
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds float, float addrspace(1)* %4, i64 %207
  store float %204, float addrspace(1)* %208, align 4, !tbaa !10
  %209 = add nuw nsw i32 %75, 1
  %210 = xor i32 %75, -1
  %211 = add nuw i32 %73, 1
  %212 = icmp eq i32 %209, %71
  br i1 %212, label %213, label %72, !llvm.loop !19

213:                                              ; preds = %201, %53
  ret void
}

; Function Attrs: convergent mustprogress nounwind willreturn
declare void @llvm.amdgcn.s.barrier() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

; Function Attrs: nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.smax.i32(i32, i32) #3

attributes #0 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { convergent mustprogress nounwind willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { nocallback nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{!6, !6, i64 0}
!6 = !{!"double", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
!12 = distinct !{!12, !13}
!13 = !{!"llvm.loop.mustprogress"}
!14 = distinct !{!14, !13}
!15 = distinct !{!15, !13}
!16 = distinct !{!16, !13}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = distinct !{!19, !13}
