; ModuleID = '../data/hip_kernels/8577/1/main.cu'
source_filename = "../data/hip_kernels/8577/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8kernel_BPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !4, !invariant.load !5
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %12 = add i32 %10, %11
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds float, float addrspace(1)* %0, i64 %13
  %15 = load float, float addrspace(1)* %14, align 4, !tbaa !7, !amdgpu.noclobber !5
  %16 = and i32 %12, 1
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %54, label %18

18:                                               ; preds = %3
  %19 = tail call i1 @llvm.amdgcn.class.f32(float %15, i32 144)
  %20 = select i1 %19, float 0x41F0000000000000, float 1.000000e+00
  %21 = fmul float %15, %20
  %22 = tail call float @llvm.log2.f32(float %21)
  %23 = fmul float %22, 0x3FE62E42E0000000
  %24 = tail call i1 @llvm.amdgcn.class.f32(float %22, i32 519)
  %25 = fneg float %23
  %26 = tail call float @llvm.fma.f32(float %22, float 0x3FE62E42E0000000, float %25)
  %27 = tail call float @llvm.fma.f32(float %22, float 0x3E6EFA39E0000000, float %26)
  %28 = fadd float %23, %27
  %29 = select i1 %24, float %22, float %28
  %30 = select i1 %19, float 0x40362E4300000000, float 0.000000e+00
  %31 = fsub float %29, %30
  %32 = fadd contract float %31, 1.000000e+00
  %33 = fcmp olt float %32, 0x39F0000000000000
  %34 = select i1 %33, float 0x41F0000000000000, float 1.000000e+00
  %35 = fmul float %32, %34
  %36 = tail call float @llvm.sqrt.f32(float %35)
  %37 = bitcast float %36 to i32
  %38 = add nsw i32 %37, -1
  %39 = bitcast i32 %38 to float
  %40 = add nsw i32 %37, 1
  %41 = bitcast i32 %40 to float
  %42 = tail call i1 @llvm.amdgcn.class.f32(float %35, i32 608)
  %43 = select i1 %33, float 0x3EF0000000000000, float 1.000000e+00
  %44 = fneg float %41
  %45 = tail call float @llvm.fma.f32(float %44, float %36, float %35)
  %46 = fcmp ogt float %45, 0.000000e+00
  %47 = fneg float %39
  %48 = tail call float @llvm.fma.f32(float %47, float %36, float %35)
  %49 = fcmp ole float %48, 0.000000e+00
  %50 = select i1 %49, float %39, float %36
  %51 = select i1 %46, float %41, float %50
  %52 = fmul float %43, %51
  %53 = select i1 %42, float %35, float %52
  br label %215

54:                                               ; preds = %3
  %55 = tail call float @llvm.fabs.f32(float %15)
  %56 = fcmp olt float %55, 1.310720e+05
  br i1 %56, label %57, label %64

57:                                               ; preds = %54
  %58 = fmul float %55, 0x3FE45F3060000000
  %59 = tail call float @llvm.rint.f32(float %58)
  %60 = tail call float @llvm.fma.f32(float %59, float 0xBFF921FB40000000, float %55)
  %61 = tail call float @llvm.fma.f32(float %59, float 0xBE74442D00000000, float %60)
  %62 = tail call float @llvm.fma.f32(float %59, float 0xBCF8469880000000, float %61)
  %63 = fptosi float %59 to i32
  br label %170

64:                                               ; preds = %54
  %65 = bitcast float %55 to i32
  %66 = lshr i32 %65, 23
  %67 = and i32 %65, 8388607
  %68 = or i32 %67, 8388608
  %69 = zext i32 %68 to i64
  %70 = mul nuw nsw i64 %69, 4266746795
  %71 = trunc i64 %70 to i32
  %72 = lshr i64 %70, 32
  %73 = mul nuw nsw i64 %69, 1011060801
  %74 = add nuw nsw i64 %72, %73
  %75 = trunc i64 %74 to i32
  %76 = lshr i64 %74, 32
  %77 = mul nuw nsw i64 %69, 3680671129
  %78 = add nuw nsw i64 %76, %77
  %79 = trunc i64 %78 to i32
  %80 = lshr i64 %78, 32
  %81 = mul nuw nsw i64 %69, 4113882560
  %82 = add nuw nsw i64 %80, %81
  %83 = trunc i64 %82 to i32
  %84 = lshr i64 %82, 32
  %85 = mul nuw nsw i64 %69, 4230436817
  %86 = add nuw nsw i64 %84, %85
  %87 = trunc i64 %86 to i32
  %88 = lshr i64 %86, 32
  %89 = mul nuw nsw i64 %69, 1313084713
  %90 = add nuw nsw i64 %88, %89
  %91 = trunc i64 %90 to i32
  %92 = lshr i64 %90, 32
  %93 = mul nuw nsw i64 %69, 2734261102
  %94 = add nuw nsw i64 %92, %93
  %95 = trunc i64 %94 to i32
  %96 = lshr i64 %94, 32
  %97 = trunc i64 %96 to i32
  %98 = add nsw i32 %66, -120
  %99 = icmp ugt i32 %98, 63
  %100 = select i1 %99, i32 %91, i32 %97
  %101 = select i1 %99, i32 %87, i32 %95
  %102 = select i1 %99, i32 %83, i32 %91
  %103 = select i1 %99, i32 %79, i32 %87
  %104 = select i1 %99, i32 %75, i32 %83
  %105 = select i1 %99, i32 %71, i32 %79
  %106 = select i1 %99, i32 -64, i32 0
  %107 = add nsw i32 %106, %98
  %108 = icmp ugt i32 %107, 31
  %109 = select i1 %108, i32 %101, i32 %100
  %110 = select i1 %108, i32 %102, i32 %101
  %111 = select i1 %108, i32 %103, i32 %102
  %112 = select i1 %108, i32 %104, i32 %103
  %113 = select i1 %108, i32 %105, i32 %104
  %114 = select i1 %108, i32 -32, i32 0
  %115 = add nsw i32 %114, %107
  %116 = icmp ugt i32 %115, 31
  %117 = select i1 %116, i32 %110, i32 %109
  %118 = select i1 %116, i32 %111, i32 %110
  %119 = select i1 %116, i32 %112, i32 %111
  %120 = select i1 %116, i32 %113, i32 %112
  %121 = select i1 %116, i32 -32, i32 0
  %122 = add nsw i32 %121, %115
  %123 = icmp eq i32 %122, 0
  %124 = sub nsw i32 32, %122
  %125 = tail call i32 @llvm.fshr.i32(i32 %117, i32 %118, i32 %124)
  %126 = tail call i32 @llvm.fshr.i32(i32 %118, i32 %119, i32 %124)
  %127 = tail call i32 @llvm.fshr.i32(i32 %119, i32 %120, i32 %124)
  %128 = select i1 %123, i32 %117, i32 %125
  %129 = select i1 %123, i32 %118, i32 %126
  %130 = select i1 %123, i32 %119, i32 %127
  %131 = lshr i32 %128, 29
  %132 = tail call i32 @llvm.fshl.i32(i32 %128, i32 %129, i32 2)
  %133 = tail call i32 @llvm.fshl.i32(i32 %129, i32 %130, i32 2)
  %134 = tail call i32 @llvm.fshl.i32(i32 %130, i32 %120, i32 2)
  %135 = and i32 %131, 1
  %136 = sub nsw i32 0, %135
  %137 = shl i32 %131, 31
  %138 = xor i32 %132, %136
  %139 = xor i32 %133, %136
  %140 = xor i32 %134, %136
  %141 = tail call i32 @llvm.ctlz.i32(i32 %138, i1 false), !range !11
  %142 = sub nsw i32 31, %141
  %143 = tail call i32 @llvm.fshr.i32(i32 %138, i32 %139, i32 %142)
  %144 = tail call i32 @llvm.fshr.i32(i32 %139, i32 %140, i32 %142)
  %145 = shl nuw nsw i32 %141, 23
  %146 = sub nuw nsw i32 1056964608, %145
  %147 = lshr i32 %143, 9
  %148 = or i32 %147, %146
  %149 = or i32 %148, %137
  %150 = bitcast i32 %149 to float
  %151 = tail call i32 @llvm.fshl.i32(i32 %143, i32 %144, i32 23)
  %152 = tail call i32 @llvm.ctlz.i32(i32 %151, i1 false), !range !11
  %153 = fmul float %150, 0x3FF921FB40000000
  %154 = add nuw nsw i32 %152, %141
  %155 = shl nuw nsw i32 %154, 23
  %156 = sub nuw nsw i32 855638016, %155
  %157 = sub nsw i32 31, %152
  %158 = tail call i32 @llvm.fshr.i32(i32 %151, i32 %144, i32 %157)
  %159 = lshr i32 %158, 9
  %160 = or i32 %156, %159
  %161 = or i32 %160, %137
  %162 = bitcast i32 %161 to float
  %163 = fneg float %153
  %164 = tail call float @llvm.fma.f32(float %150, float 0x3FF921FB40000000, float %163)
  %165 = tail call float @llvm.fma.f32(float %150, float 0x3E74442D00000000, float %164)
  %166 = tail call float @llvm.fma.f32(float %162, float 0x3FF921FB40000000, float %165)
  %167 = fadd float %153, %166
  %168 = lshr i32 %128, 30
  %169 = add nuw nsw i32 %135, %168
  br label %170

170:                                              ; preds = %57, %64
  %171 = phi float [ %62, %57 ], [ %167, %64 ]
  %172 = phi i32 [ %63, %57 ], [ %169, %64 ]
  %173 = fmul float %171, %171
  %174 = tail call float @llvm.fmuladd.f32(float %173, float 0xBF29833040000000, float 0x3F81103880000000)
  %175 = tail call float @llvm.fmuladd.f32(float %173, float %174, float 0xBFC55553A0000000)
  %176 = fmul float %173, %175
  %177 = tail call float @llvm.fmuladd.f32(float %171, float %176, float %171)
  %178 = tail call float @llvm.fmuladd.f32(float %173, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %179 = tail call float @llvm.fmuladd.f32(float %173, float %178, float 0x3FA5557EE0000000)
  %180 = tail call float @llvm.fmuladd.f32(float %173, float %179, float 0xBFE0000080000000)
  %181 = tail call float @llvm.fmuladd.f32(float %173, float %180, float 1.000000e+00)
  %182 = fneg float %177
  %183 = and i32 %172, 1
  %184 = icmp eq i32 %183, 0
  %185 = select i1 %184, float %181, float %182
  %186 = bitcast float %185 to i32
  %187 = shl i32 %172, 30
  %188 = and i32 %187, -2147483648
  %189 = xor i32 %188, %186
  %190 = bitcast i32 %189 to float
  %191 = tail call i1 @llvm.amdgcn.class.f32(float %55, i32 504)
  %192 = fadd contract float %190, 1.000000e+00
  %193 = select i1 %191, float %192, float 0x7FF8000000000000
  %194 = fcmp olt float %193, 0x39F0000000000000
  %195 = select i1 %194, float 0x41F0000000000000, float 1.000000e+00
  %196 = fmul float %193, %195
  %197 = tail call float @llvm.sqrt.f32(float %196)
  %198 = bitcast float %197 to i32
  %199 = add nsw i32 %198, -1
  %200 = bitcast i32 %199 to float
  %201 = add nsw i32 %198, 1
  %202 = bitcast i32 %201 to float
  %203 = tail call i1 @llvm.amdgcn.class.f32(float %196, i32 608)
  %204 = select i1 %194, float 0x3EF0000000000000, float 1.000000e+00
  %205 = fneg float %202
  %206 = tail call float @llvm.fma.f32(float %205, float %197, float %196)
  %207 = fcmp ogt float %206, 0.000000e+00
  %208 = fneg float %200
  %209 = tail call float @llvm.fma.f32(float %208, float %197, float %196)
  %210 = fcmp ole float %209, 0.000000e+00
  %211 = select i1 %210, float %200, float %197
  %212 = select i1 %207, float %202, float %211
  %213 = fmul float %204, %212
  %214 = select i1 %203, float %196, float %213
  br label %215

215:                                              ; preds = %170, %18
  %216 = phi float [ %53, %18 ], [ %214, %170 ]
  %217 = fadd contract float %15, %216
  store float %217, float addrspace(1)* %14, align 4, !tbaa !7
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fabs.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i1 @llvm.amdgcn.class.f32(float, i32) #2

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fmuladd.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshr.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.fshl.i32(i32, i32, i32) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.ctlz.i32(i32, i1 immarg) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.fma.f32(float, float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.rint.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.log2.f32(float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.sqrt.f32(float) #1

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #1 = { mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"float", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C++ TBAA"}
!11 = !{i32 0, i32 33}
