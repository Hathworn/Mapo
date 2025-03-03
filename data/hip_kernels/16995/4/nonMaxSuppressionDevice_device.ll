; ModuleID = '../data/hip_kernels/16995/4/main.cu'
source_filename = "../data/hip_kernels/16995/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z23nonMaxSuppressionDeviceiiPfS_S_S_(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, float addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture readonly %4, float addrspace(1)* nocapture writeonly %5) local_unnamed_addr #0 {
  %7 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %8 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %9 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %10 = getelementptr i8, i8 addrspace(4)* %9, i64 4
  %11 = bitcast i8 addrspace(4)* %10 to i16 addrspace(4)*
  %12 = load i16, i16 addrspace(4)* %11, align 4, !range !5, !invariant.load !6
  %13 = zext i16 %12 to i32
  %14 = mul i32 %8, %13
  %15 = add i32 %14, %7
  %16 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !4
  %17 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %18 = getelementptr i8, i8 addrspace(4)* %9, i64 6
  %19 = bitcast i8 addrspace(4)* %18 to i16 addrspace(4)*
  %20 = load i16, i16 addrspace(4)* %19, align 2, !range !5, !invariant.load !6
  %21 = zext i16 %20 to i32
  %22 = mul i32 %17, %21
  %23 = add i32 %22, %16
  %24 = icmp slt i32 %15, %0
  %25 = icmp slt i32 %23, %1
  %26 = select i1 %24, i1 %25, i1 false
  br i1 %26, label %27, label %184

27:                                               ; preds = %6
  %28 = mul nsw i32 %23, %0
  %29 = add nsw i32 %28, %15
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds float, float addrspace(1)* %4, i64 %30
  %32 = load float, float addrspace(1)* %31, align 4, !tbaa !7, !amdgpu.noclobber !6
  %33 = add nsw i32 %29, 1
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds float, float addrspace(1)* %4, i64 %34
  %36 = load float, float addrspace(1)* %35, align 4, !tbaa !7, !amdgpu.noclobber !6
  %37 = add nsw i32 %29, -1
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds float, float addrspace(1)* %4, i64 %38
  %40 = load float, float addrspace(1)* %39, align 4, !tbaa !7, !amdgpu.noclobber !6
  %41 = add nsw i32 %29, %0
  %42 = add nsw i32 %41, 1
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds float, float addrspace(1)* %4, i64 %43
  %45 = load float, float addrspace(1)* %44, align 4, !tbaa !7, !amdgpu.noclobber !6
  %46 = sub nsw i32 %29, %0
  %47 = add nsw i32 %46, -1
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds float, float addrspace(1)* %4, i64 %48
  %50 = load float, float addrspace(1)* %49, align 4, !tbaa !7, !amdgpu.noclobber !6
  %51 = sext i32 %41 to i64
  %52 = getelementptr inbounds float, float addrspace(1)* %4, i64 %51
  %53 = load float, float addrspace(1)* %52, align 4, !tbaa !7, !amdgpu.noclobber !6
  %54 = sext i32 %46 to i64
  %55 = getelementptr inbounds float, float addrspace(1)* %4, i64 %54
  %56 = load float, float addrspace(1)* %55, align 4, !tbaa !7, !amdgpu.noclobber !6
  %57 = add nsw i32 %46, 1
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds float, float addrspace(1)* %4, i64 %58
  %60 = load float, float addrspace(1)* %59, align 4, !tbaa !7, !amdgpu.noclobber !6
  %61 = add nsw i32 %41, -1
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds float, float addrspace(1)* %4, i64 %62
  %64 = load float, float addrspace(1)* %63, align 4, !tbaa !7, !amdgpu.noclobber !6
  %65 = getelementptr inbounds float, float addrspace(1)* %2, i64 %30
  %66 = load float, float addrspace(1)* %65, align 4, !tbaa !7, !amdgpu.noclobber !6
  %67 = getelementptr inbounds float, float addrspace(1)* %3, i64 %30
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !7, !amdgpu.noclobber !6
  %69 = icmp slt i32 %29, %0
  br i1 %69, label %74, label %70

70:                                               ; preds = %27
  %71 = add nsw i32 %1, -1
  %72 = mul nsw i32 %71, %0
  %73 = icmp slt i32 %29, %72
  br i1 %73, label %76, label %74

74:                                               ; preds = %70, %27
  %75 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  store float 0.000000e+00, float addrspace(1)* %75, align 4, !tbaa !7
  br label %184

76:                                               ; preds = %70
  %77 = srem i32 %29, %0
  %78 = icmp eq i32 %77, 0
  %79 = add nsw i32 %0, -1
  %80 = icmp eq i32 %77, %79
  %81 = select i1 %78, i1 true, i1 %80
  br i1 %81, label %82, label %84

82:                                               ; preds = %76
  %83 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  store float 0.000000e+00, float addrspace(1)* %83, align 4, !tbaa !7
  br label %184

84:                                               ; preds = %76
  %85 = fcmp contract oeq float %32, 0.000000e+00
  br i1 %85, label %86, label %88

86:                                               ; preds = %84
  %87 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  store float 0.000000e+00, float addrspace(1)* %87, align 4, !tbaa !7
  br label %175

88:                                               ; preds = %84
  %89 = fcmp contract ult float %66, 0.000000e+00
  %90 = fcmp contract ult float %68, 0.000000e+00
  br i1 %89, label %133, label %91

91:                                               ; preds = %88
  br i1 %90, label %112, label %92

92:                                               ; preds = %91
  %93 = fcmp contract ult float %66, %68
  br i1 %93, label %103, label %94

94:                                               ; preds = %92
  %95 = fdiv contract float %68, %66
  %96 = fsub contract float 1.000000e+00, %95
  %97 = fmul contract float %36, %96
  %98 = fmul contract float %45, %95
  %99 = fadd contract float %98, %97
  %100 = fmul contract float %40, %96
  %101 = fmul contract float %64, %95
  %102 = fadd contract float %101, %100
  br label %175

103:                                              ; preds = %92
  %104 = fdiv contract float %66, %68
  %105 = fsub contract float 1.000000e+00, %104
  %106 = fmul contract float %53, %105
  %107 = fmul contract float %45, %104
  %108 = fadd contract float %107, %106
  %109 = fmul contract float %56, %105
  %110 = fmul contract float %50, %104
  %111 = fadd contract float %110, %109
  br label %175

112:                                              ; preds = %91
  %113 = fneg contract float %68
  %114 = fcmp contract ult float %66, %113
  br i1 %114, label %124, label %115

115:                                              ; preds = %112
  %116 = fdiv contract float %113, %66
  %117 = fsub contract float 1.000000e+00, %116
  %118 = fmul contract float %36, %117
  %119 = fmul contract float %60, %116
  %120 = fadd contract float %119, %118
  %121 = fmul contract float %40, %117
  %122 = fmul contract float %64, %116
  %123 = fadd contract float %122, %121
  br label %175

124:                                              ; preds = %112
  %125 = fdiv contract float %66, %113
  %126 = fsub contract float 1.000000e+00, %125
  %127 = fmul contract float %53, %126
  %128 = fmul contract float %64, %125
  %129 = fadd contract float %128, %127
  %130 = fmul contract float %56, %126
  %131 = fmul contract float %60, %125
  %132 = fadd contract float %131, %130
  br label %175

133:                                              ; preds = %88
  br i1 %90, label %155, label %134

134:                                              ; preds = %133
  %135 = fneg contract float %66
  %136 = fcmp contract ult float %68, %135
  br i1 %136, label %146, label %137

137:                                              ; preds = %134
  %138 = fdiv contract float %135, %68
  %139 = fsub contract float 1.000000e+00, %138
  %140 = fmul contract float %53, %139
  %141 = fmul contract float %64, %138
  %142 = fadd contract float %141, %140
  %143 = fmul contract float %56, %139
  %144 = fmul contract float %60, %138
  %145 = fadd contract float %144, %143
  br label %175

146:                                              ; preds = %134
  %147 = fdiv contract float %68, %135
  %148 = fsub contract float 1.000000e+00, %147
  %149 = fmul contract float %40, %148
  %150 = fmul contract float %64, %147
  %151 = fadd contract float %150, %149
  %152 = fmul contract float %36, %148
  %153 = fmul contract float %60, %147
  %154 = fadd contract float %153, %152
  br label %175

155:                                              ; preds = %133
  %156 = fcmp contract ult float %68, %66
  br i1 %156, label %166, label %157

157:                                              ; preds = %155
  %158 = fdiv contract float %68, %66
  %159 = fsub contract float 1.000000e+00, %158
  %160 = fmul contract float %40, %159
  %161 = fmul contract float %50, %158
  %162 = fadd contract float %161, %160
  %163 = fmul contract float %36, %159
  %164 = fmul contract float %45, %158
  %165 = fadd contract float %164, %163
  br label %175

166:                                              ; preds = %155
  %167 = fdiv contract float %66, %68
  %168 = fsub contract float 1.000000e+00, %167
  %169 = fmul contract float %53, %168
  %170 = fmul contract float %45, %167
  %171 = fadd contract float %170, %169
  %172 = fmul contract float %56, %168
  %173 = fmul contract float %50, %167
  %174 = fadd contract float %173, %172
  br label %175

175:                                              ; preds = %115, %124, %94, %103, %157, %166, %137, %146, %86
  %176 = phi float [ undef, %86 ], [ %102, %94 ], [ %111, %103 ], [ %123, %115 ], [ %132, %124 ], [ %145, %137 ], [ %154, %146 ], [ %165, %157 ], [ %174, %166 ]
  %177 = phi float [ undef, %86 ], [ %99, %94 ], [ %108, %103 ], [ %120, %115 ], [ %129, %124 ], [ %142, %137 ], [ %151, %146 ], [ %162, %157 ], [ %171, %166 ]
  %178 = fcmp contract olt float %32, %177
  %179 = fcmp contract olt float %32, %176
  %180 = select i1 %178, i1 true, i1 %179
  %181 = getelementptr inbounds float, float addrspace(1)* %5, i64 %30
  br i1 %180, label %182, label %183

182:                                              ; preds = %175
  store float 0.000000e+00, float addrspace(1)* %181, align 4, !tbaa !7
  br label %184

183:                                              ; preds = %175
  store float %32, float addrspace(1)* %181, align 4, !tbaa !7
  br label %184

184:                                              ; preds = %74, %182, %183, %82, %6
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.y() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #1

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

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
