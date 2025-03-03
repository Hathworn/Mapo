; ModuleID = '../data/hip_kernels/8577/2/main.cu'
source_filename = "../data/hip_kernels/8577/2/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.HIP_vector_type = type { %struct.HIP_vector_base }
%struct.HIP_vector_base = type { %union.anon }
%union.anon = type { <2 x float> }

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z8kernel_CPfii(float addrspace(1)* nocapture %0, i32 %1, i32 %2) local_unnamed_addr #0 {
  %4 = bitcast float addrspace(1)* %0 to %struct.HIP_vector_type addrspace(1)*
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %13 = add i32 %11, %12
  %14 = sext i32 %13 to i64
  %15 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %14, i32 0, i32 0, i32 0, i64 0
  %16 = load float, float addrspace(1)* %15, align 8, !amdgpu.noclobber !5
  %17 = getelementptr inbounds %struct.HIP_vector_type, %struct.HIP_vector_type addrspace(1)* %4, i64 %14, i32 0, i32 0, i32 0, i64 1
  %18 = load float, float addrspace(1)* %17, align 4, !amdgpu.noclobber !5
  %19 = tail call float @llvm.fabs.f32(float %16)
  %20 = fcmp olt float %19, 1.310720e+05
  br i1 %20, label %21, label %28

21:                                               ; preds = %3
  %22 = fmul float %19, 0x3FE45F3060000000
  %23 = tail call float @llvm.rint.f32(float %22)
  %24 = tail call float @llvm.fma.f32(float %23, float 0xBFF921FB40000000, float %19)
  %25 = tail call float @llvm.fma.f32(float %23, float 0xBE74442D00000000, float %24)
  %26 = tail call float @llvm.fma.f32(float %23, float 0xBCF8469880000000, float %25)
  %27 = fptosi float %23 to i32
  br label %134

28:                                               ; preds = %3
  %29 = bitcast float %19 to i32
  %30 = lshr i32 %29, 23
  %31 = and i32 %29, 8388607
  %32 = or i32 %31, 8388608
  %33 = zext i32 %32 to i64
  %34 = mul nuw nsw i64 %33, 4266746795
  %35 = trunc i64 %34 to i32
  %36 = lshr i64 %34, 32
  %37 = mul nuw nsw i64 %33, 1011060801
  %38 = add nuw nsw i64 %36, %37
  %39 = trunc i64 %38 to i32
  %40 = lshr i64 %38, 32
  %41 = mul nuw nsw i64 %33, 3680671129
  %42 = add nuw nsw i64 %40, %41
  %43 = trunc i64 %42 to i32
  %44 = lshr i64 %42, 32
  %45 = mul nuw nsw i64 %33, 4113882560
  %46 = add nuw nsw i64 %44, %45
  %47 = trunc i64 %46 to i32
  %48 = lshr i64 %46, 32
  %49 = mul nuw nsw i64 %33, 4230436817
  %50 = add nuw nsw i64 %48, %49
  %51 = trunc i64 %50 to i32
  %52 = lshr i64 %50, 32
  %53 = mul nuw nsw i64 %33, 1313084713
  %54 = add nuw nsw i64 %52, %53
  %55 = trunc i64 %54 to i32
  %56 = lshr i64 %54, 32
  %57 = mul nuw nsw i64 %33, 2734261102
  %58 = add nuw nsw i64 %56, %57
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = trunc i64 %60 to i32
  %62 = add nsw i32 %30, -120
  %63 = icmp ugt i32 %62, 63
  %64 = select i1 %63, i32 %55, i32 %61
  %65 = select i1 %63, i32 %51, i32 %59
  %66 = select i1 %63, i32 %47, i32 %55
  %67 = select i1 %63, i32 %43, i32 %51
  %68 = select i1 %63, i32 %39, i32 %47
  %69 = select i1 %63, i32 %35, i32 %43
  %70 = select i1 %63, i32 -64, i32 0
  %71 = add nsw i32 %70, %62
  %72 = icmp ugt i32 %71, 31
  %73 = select i1 %72, i32 %65, i32 %64
  %74 = select i1 %72, i32 %66, i32 %65
  %75 = select i1 %72, i32 %67, i32 %66
  %76 = select i1 %72, i32 %68, i32 %67
  %77 = select i1 %72, i32 %69, i32 %68
  %78 = select i1 %72, i32 -32, i32 0
  %79 = add nsw i32 %78, %71
  %80 = icmp ugt i32 %79, 31
  %81 = select i1 %80, i32 %74, i32 %73
  %82 = select i1 %80, i32 %75, i32 %74
  %83 = select i1 %80, i32 %76, i32 %75
  %84 = select i1 %80, i32 %77, i32 %76
  %85 = select i1 %80, i32 -32, i32 0
  %86 = add nsw i32 %85, %79
  %87 = icmp eq i32 %86, 0
  %88 = sub nsw i32 32, %86
  %89 = tail call i32 @llvm.fshr.i32(i32 %81, i32 %82, i32 %88)
  %90 = tail call i32 @llvm.fshr.i32(i32 %82, i32 %83, i32 %88)
  %91 = tail call i32 @llvm.fshr.i32(i32 %83, i32 %84, i32 %88)
  %92 = select i1 %87, i32 %81, i32 %89
  %93 = select i1 %87, i32 %82, i32 %90
  %94 = select i1 %87, i32 %83, i32 %91
  %95 = lshr i32 %92, 29
  %96 = tail call i32 @llvm.fshl.i32(i32 %92, i32 %93, i32 2)
  %97 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %94, i32 2)
  %98 = tail call i32 @llvm.fshl.i32(i32 %94, i32 %84, i32 2)
  %99 = and i32 %95, 1
  %100 = sub nsw i32 0, %99
  %101 = shl i32 %95, 31
  %102 = xor i32 %96, %100
  %103 = xor i32 %97, %100
  %104 = xor i32 %98, %100
  %105 = tail call i32 @llvm.ctlz.i32(i32 %102, i1 false), !range !7
  %106 = sub nsw i32 31, %105
  %107 = tail call i32 @llvm.fshr.i32(i32 %102, i32 %103, i32 %106)
  %108 = tail call i32 @llvm.fshr.i32(i32 %103, i32 %104, i32 %106)
  %109 = shl nuw nsw i32 %105, 23
  %110 = sub nuw nsw i32 1056964608, %109
  %111 = lshr i32 %107, 9
  %112 = or i32 %111, %110
  %113 = or i32 %112, %101
  %114 = bitcast i32 %113 to float
  %115 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %108, i32 23)
  %116 = tail call i32 @llvm.ctlz.i32(i32 %115, i1 false), !range !7
  %117 = fmul float %114, 0x3FF921FB40000000
  %118 = add nuw nsw i32 %116, %105
  %119 = shl nuw nsw i32 %118, 23
  %120 = sub nuw nsw i32 855638016, %119
  %121 = sub nsw i32 31, %116
  %122 = tail call i32 @llvm.fshr.i32(i32 %115, i32 %108, i32 %121)
  %123 = lshr i32 %122, 9
  %124 = or i32 %120, %123
  %125 = or i32 %124, %101
  %126 = bitcast i32 %125 to float
  %127 = fneg float %117
  %128 = tail call float @llvm.fma.f32(float %114, float 0x3FF921FB40000000, float %127)
  %129 = tail call float @llvm.fma.f32(float %114, float 0x3E74442D00000000, float %128)
  %130 = tail call float @llvm.fma.f32(float %126, float 0x3FF921FB40000000, float %129)
  %131 = fadd float %117, %130
  %132 = lshr i32 %92, 30
  %133 = add nuw nsw i32 %99, %132
  br label %134

134:                                              ; preds = %21, %28
  %135 = phi float [ %26, %21 ], [ %131, %28 ]
  %136 = phi i32 [ %27, %21 ], [ %133, %28 ]
  %137 = fmul float %135, %135
  %138 = tail call float @llvm.fmuladd.f32(float %137, float 0xBF29833040000000, float 0x3F81103880000000)
  %139 = tail call float @llvm.fmuladd.f32(float %137, float %138, float 0xBFC55553A0000000)
  %140 = fmul float %137, %139
  %141 = tail call float @llvm.fmuladd.f32(float %135, float %140, float %135)
  %142 = tail call float @llvm.fmuladd.f32(float %137, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %143 = tail call float @llvm.fmuladd.f32(float %137, float %142, float 0x3FA5557EE0000000)
  %144 = tail call float @llvm.fmuladd.f32(float %137, float %143, float 0xBFE0000080000000)
  %145 = tail call float @llvm.fmuladd.f32(float %137, float %144, float 1.000000e+00)
  %146 = fneg float %141
  %147 = and i32 %136, 1
  %148 = icmp eq i32 %147, 0
  %149 = select i1 %148, float %145, float %146
  %150 = bitcast float %149 to i32
  %151 = shl i32 %136, 30
  %152 = and i32 %151, -2147483648
  %153 = xor i32 %152, %150
  %154 = bitcast i32 %153 to float
  %155 = tail call i1 @llvm.amdgcn.class.f32(float %19, i32 504)
  %156 = fadd contract float %154, 1.000000e+00
  %157 = select i1 %155, float %156, float 0x7FF8000000000000
  %158 = fcmp olt float %157, 0x39F0000000000000
  %159 = select i1 %158, float 0x41F0000000000000, float 1.000000e+00
  %160 = fmul float %157, %159
  %161 = tail call float @llvm.sqrt.f32(float %160)
  %162 = bitcast float %161 to i32
  %163 = add nsw i32 %162, -1
  %164 = bitcast i32 %163 to float
  %165 = add nsw i32 %162, 1
  %166 = bitcast i32 %165 to float
  %167 = tail call i1 @llvm.amdgcn.class.f32(float %160, i32 608)
  %168 = select i1 %158, float 0x3EF0000000000000, float 1.000000e+00
  %169 = fneg float %166
  %170 = tail call float @llvm.fma.f32(float %169, float %161, float %160)
  %171 = fcmp ogt float %170, 0.000000e+00
  %172 = fneg float %164
  %173 = tail call float @llvm.fma.f32(float %172, float %161, float %160)
  %174 = fcmp ole float %173, 0.000000e+00
  %175 = select i1 %174, float %164, float %161
  %176 = select i1 %171, float %166, float %175
  %177 = fmul float %168, %176
  %178 = select i1 %167, float %160, float %177
  %179 = fadd contract float %16, %178
  %180 = tail call i1 @llvm.amdgcn.class.f32(float %18, i32 144)
  %181 = select i1 %180, float 0x41F0000000000000, float 1.000000e+00
  %182 = fmul float %18, %181
  %183 = tail call float @llvm.log2.f32(float %182)
  %184 = fmul float %183, 0x3FE62E42E0000000
  %185 = tail call i1 @llvm.amdgcn.class.f32(float %183, i32 519)
  %186 = fneg float %184
  %187 = tail call float @llvm.fma.f32(float %183, float 0x3FE62E42E0000000, float %186)
  %188 = tail call float @llvm.fma.f32(float %183, float 0x3E6EFA39E0000000, float %187)
  %189 = fadd float %184, %188
  %190 = select i1 %185, float %183, float %189
  %191 = select i1 %180, float 0x40362E4300000000, float 0.000000e+00
  %192 = fsub float %190, %191
  %193 = fadd contract float %192, 1.000000e+00
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
  %215 = fadd contract float %18, %214
  store float %179, float addrspace(1)* %15, align 8
  store float %215, float addrspace(1)* %17, align 4
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
!7 = !{i32 0, i32 33}
