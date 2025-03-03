; ModuleID = '../data/hip_kernels/10325/28/main.cu'
source_filename = "../data/hip_kernels/10325/28/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@d_ConstantA = protected addrspace(4) externally_initialized global [8 x float] zeroinitializer, align 16
@d_ConstantB = protected addrspace(4) externally_initialized global [8 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [2 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast ([8 x float] addrspace(4)* @d_ConstantA to i8 addrspace(4)*) to i8*), i8* addrspacecast (i8 addrspace(4)* bitcast ([8 x float] addrspace(4)* @d_ConstantB to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16ComputePositionsPfS_S_PiS_iiii(float addrspace(1)* nocapture readonly %0, float addrspace(1)* nocapture readonly %1, float addrspace(1)* nocapture readonly %2, i32 addrspace(1)* nocapture readonly %3, float addrspace(1)* nocapture writeonly %4, i32 %5, i32 %6, i32 %7, i32 %8) local_unnamed_addr #0 {
  %10 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %11 = shl i32 %10, 8
  %12 = ashr exact i32 %11, 3
  %13 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %14 = add nsw i32 %12, %13
  %15 = icmp slt i32 %14, %5
  br i1 %15, label %16, label %206

16:                                               ; preds = %9
  %17 = sext i32 %14 to i64
  %18 = getelementptr inbounds i32, i32 addrspace(1)* %3, i64 %17
  %19 = load i32, i32 addrspace(1)* %18, align 4, !tbaa !5, !amdgpu.noclobber !9
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds float, float addrspace(1)* %1, i64 %20
  %22 = load float, float addrspace(1)* %21, align 4, !tbaa !10, !amdgpu.noclobber !9
  %23 = add nsw i32 %19, -1
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds float, float addrspace(1)* %1, i64 %24
  %26 = load float, float addrspace(1)* %25, align 4, !tbaa !10, !amdgpu.noclobber !9
  %27 = add nsw i32 %19, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %1, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !10, !amdgpu.noclobber !9
  %31 = fsub contract float %30, %26
  %32 = fmul contract float %31, 5.000000e-01
  %33 = fmul contract float %22, 2.000000e+00
  %34 = fsub contract float %33, %26
  %35 = fsub contract float %34, %30
  %36 = sub nsw i32 %19, %7
  %37 = sext i32 %36 to i64
  %38 = getelementptr inbounds float, float addrspace(1)* %1, i64 %37
  %39 = load float, float addrspace(1)* %38, align 4, !tbaa !10, !amdgpu.noclobber !9
  %40 = add nsw i32 %19, %7
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds float, float addrspace(1)* %1, i64 %41
  %43 = load float, float addrspace(1)* %42, align 4, !tbaa !10, !amdgpu.noclobber !9
  %44 = fsub contract float %43, %39
  %45 = fmul contract float %44, 5.000000e-01
  %46 = fsub contract float %33, %39
  %47 = fsub contract float %46, %43
  %48 = getelementptr inbounds float, float addrspace(1)* %2, i64 %20
  %49 = load float, float addrspace(1)* %48, align 4, !tbaa !10, !amdgpu.noclobber !9
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %20
  %51 = load float, float addrspace(1)* %50, align 4, !tbaa !10, !amdgpu.noclobber !9
  %52 = fsub contract float %51, %49
  %53 = fmul contract float %52, 5.000000e-01
  %54 = fsub contract float %33, %49
  %55 = fsub contract float %54, %51
  %56 = add nsw i32 %40, 1
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds float, float addrspace(1)* %1, i64 %57
  %59 = load float, float addrspace(1)* %58, align 4, !tbaa !10, !amdgpu.noclobber !9
  %60 = add nsw i32 %36, -1
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds float, float addrspace(1)* %1, i64 %61
  %63 = load float, float addrspace(1)* %62, align 4, !tbaa !10, !amdgpu.noclobber !9
  %64 = fadd contract float %59, %63
  %65 = add nsw i32 %36, 1
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds float, float addrspace(1)* %1, i64 %66
  %68 = load float, float addrspace(1)* %67, align 4, !tbaa !10, !amdgpu.noclobber !9
  %69 = fsub contract float %64, %68
  %70 = add nsw i32 %40, -1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds float, float addrspace(1)* %1, i64 %71
  %73 = load float, float addrspace(1)* %72, align 4, !tbaa !10, !amdgpu.noclobber !9
  %74 = fsub contract float %69, %73
  %75 = fmul contract float %74, 2.500000e-01
  %76 = getelementptr inbounds float, float addrspace(1)* %2, i64 %28
  %77 = load float, float addrspace(1)* %76, align 4, !tbaa !10, !amdgpu.noclobber !9
  %78 = getelementptr inbounds float, float addrspace(1)* %0, i64 %24
  %79 = load float, float addrspace(1)* %78, align 4, !tbaa !10, !amdgpu.noclobber !9
  %80 = fadd contract float %77, %79
  %81 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %82 = load float, float addrspace(1)* %81, align 4, !tbaa !10, !amdgpu.noclobber !9
  %83 = fsub contract float %80, %82
  %84 = getelementptr inbounds float, float addrspace(1)* %2, i64 %24
  %85 = load float, float addrspace(1)* %84, align 4, !tbaa !10, !amdgpu.noclobber !9
  %86 = fsub contract float %83, %85
  %87 = fmul contract float %86, 2.500000e-01
  %88 = getelementptr inbounds float, float addrspace(1)* %2, i64 %41
  %89 = load float, float addrspace(1)* %88, align 4, !tbaa !10, !amdgpu.noclobber !9
  %90 = getelementptr inbounds float, float addrspace(1)* %0, i64 %37
  %91 = load float, float addrspace(1)* %90, align 4, !tbaa !10, !amdgpu.noclobber !9
  %92 = fadd contract float %89, %91
  %93 = getelementptr inbounds float, float addrspace(1)* %2, i64 %37
  %94 = load float, float addrspace(1)* %93, align 4, !tbaa !10, !amdgpu.noclobber !9
  %95 = fsub contract float %92, %94
  %96 = getelementptr inbounds float, float addrspace(1)* %0, i64 %41
  %97 = load float, float addrspace(1)* %96, align 4, !tbaa !10, !amdgpu.noclobber !9
  %98 = fsub contract float %95, %97
  %99 = fmul contract float %98, 2.500000e-01
  %100 = fmul contract float %47, %55
  %101 = fmul contract float %99, %99
  %102 = fsub contract float %100, %101
  %103 = fmul contract float %87, %99
  %104 = fmul contract float %55, %75
  %105 = fsub contract float %103, %104
  %106 = fmul contract float %75, %99
  %107 = fmul contract float %47, %87
  %108 = fsub contract float %106, %107
  %109 = fmul contract float %35, %55
  %110 = fmul contract float %87, %87
  %111 = fsub contract float %109, %110
  %112 = fmul contract float %75, %87
  %113 = fmul contract float %35, %99
  %114 = fsub contract float %112, %113
  %115 = fmul contract float %35, %47
  %116 = fmul contract float %75, %75
  %117 = fsub contract float %115, %116
  %118 = fmul contract float %35, %102
  %119 = fmul contract float %75, %105
  %120 = fadd contract float %118, %119
  %121 = fmul contract float %87, %108
  %122 = fadd contract float %121, %120
  %123 = fdiv contract float 1.000000e+00, %122
  %124 = fmul contract float %32, %102
  %125 = fmul contract float %45, %105
  %126 = fadd contract float %124, %125
  %127 = fmul contract float %53, %108
  %128 = fadd contract float %127, %126
  %129 = fmul contract float %128, %123
  %130 = fmul contract float %32, %105
  %131 = fmul contract float %45, %111
  %132 = fadd contract float %131, %130
  %133 = fmul contract float %53, %114
  %134 = fadd contract float %133, %132
  %135 = fmul contract float %134, %123
  %136 = fmul contract float %32, %108
  %137 = fmul contract float %45, %114
  %138 = fadd contract float %136, %137
  %139 = fmul contract float %53, %117
  %140 = fadd contract float %139, %138
  %141 = fmul contract float %140, %123
  %142 = fcmp contract olt float %129, -5.000000e-01
  %143 = fcmp contract ogt float %129, 5.000000e-01
  %144 = or i1 %142, %143
  %145 = fcmp contract olt float %135, -5.000000e-01
  %146 = select i1 %144, i1 true, i1 %145
  %147 = fcmp contract ogt float %135, 5.000000e-01
  %148 = select i1 %146, i1 true, i1 %147
  %149 = fcmp contract olt float %141, -5.000000e-01
  %150 = select i1 %148, i1 true, i1 %149
  %151 = fcmp contract ogt float %141, 5.000000e-01
  %152 = select i1 %150, i1 true, i1 %151
  br i1 %152, label %153, label %157

153:                                              ; preds = %16
  %154 = fdiv contract float %32, %35
  %155 = fdiv contract float %45, %47
  %156 = fdiv contract float %53, %55
  br label %157

157:                                              ; preds = %16, %153
  %158 = phi float [ %154, %153 ], [ %129, %16 ]
  %159 = phi float [ %155, %153 ], [ %135, %16 ]
  %160 = phi float [ %156, %153 ], [ %141, %16 ]
  %161 = fmul contract float %32, %158
  %162 = fmul contract float %45, %159
  %163 = fadd contract float %161, %162
  %164 = fmul contract float %53, %160
  %165 = fadd contract float %163, %164
  %166 = fmul contract float %165, 5.000000e-01
  %167 = freeze i32 %19
  %168 = freeze i32 %7
  %169 = sdiv i32 %167, %168
  %170 = mul i32 %169, %168
  %171 = sub i32 %167, %170
  %172 = sitofp i32 %171 to float
  %173 = fadd contract float %158, %172
  %174 = getelementptr inbounds float, float addrspace(1)* %4, i64 %17
  store float %173, float addrspace(1)* %174, align 4, !tbaa !10
  %175 = sitofp i32 %169 to float
  %176 = fadd contract float %159, %175
  %177 = add nsw i32 %14, %6
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %4, i64 %178
  store float %176, float addrspace(1)* %179, align 4, !tbaa !10
  %180 = load float, float addrspace(4)* getelementptr inbounds ([8 x float], [8 x float] addrspace(4)* @d_ConstantA, i64 0, i64 0), align 16, !tbaa !10
  %181 = load float, float addrspace(4)* getelementptr inbounds ([8 x float], [8 x float] addrspace(4)* @d_ConstantB, i64 0, i64 0), align 16, !tbaa !10
  %182 = fmul contract float %160, %181
  %183 = fcmp olt float %182, -1.260000e+02
  %184 = select i1 %183, float 0x3BF0000000000000, float 1.000000e+00
  %185 = select i1 %183, float 6.400000e+01, float 0.000000e+00
  %186 = fadd float %182, %185
  %187 = tail call float @llvm.exp2.f32(float %186)
  %188 = fmul float %184, %187
  %189 = fmul contract float %180, %188
  %190 = shl nsw i32 %6, 1
  %191 = add nsw i32 %190, %14
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds float, float addrspace(1)* %4, i64 %192
  store float %189, float addrspace(1)* %193, align 4, !tbaa !10
  %194 = fadd contract float %22, %166
  %195 = mul nsw i32 %6, 3
  %196 = add nsw i32 %195, %14
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds float, float addrspace(1)* %4, i64 %197
  store float %194, float addrspace(1)* %198, align 4, !tbaa !10
  %199 = fadd contract float %35, %47
  %200 = fmul contract float %199, %199
  %201 = fdiv contract float %200, %117
  %202 = shl nsw i32 %6, 2
  %203 = add nsw i32 %202, %14
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds float, float addrspace(1)* %4, i64 %204
  store float %201, float addrspace(1)* %205, align 4, !tbaa !10
  br label %206

206:                                              ; preds = %9, %157
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.exp2.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
!5 = !{!6, !6, i64 0}
!6 = !{!"int", !7, i64 0}
!7 = !{!"omnipotent char", !8, i64 0}
!8 = !{!"Simple C++ TBAA"}
!9 = !{}
!10 = !{!11, !11, i64 0}
!11 = !{!"float", !7, i64 0}
