; ModuleID = '../data/hip_kernels/5629/6/main.cu'
source_filename = "../data/hip_kernels/5629/6/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6kernelPfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = add i32 %3, %1
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !5, !invariant.load !6
  %10 = zext i16 %9 to i32
  %11 = mul i32 %5, %10
  %12 = add i32 %4, %11
  %13 = sitofp i32 %12 to float
  %14 = tail call float @llvm.fabs.f32(float %13)
  %15 = fcmp olt float %14, 1.310720e+05
  br i1 %15, label %16, label %46

16:                                               ; preds = %2
  %17 = fmul float %14, 0x3FE45F3060000000
  %18 = tail call float @llvm.rint.f32(float %17)
  %19 = tail call float @llvm.fma.f32(float %18, float 0xBFF921FB40000000, float %14)
  %20 = tail call float @llvm.fma.f32(float %18, float 0xBE74442D00000000, float %19)
  %21 = tail call float @llvm.fma.f32(float %18, float 0xBCF8469880000000, float %20)
  %22 = fptosi float %18 to i32
  %23 = bitcast float %14 to i32
  %24 = fmul float %21, %21
  %25 = tail call float @llvm.fmuladd.f32(float %24, float 0xBF29833040000000, float 0x3F81103880000000)
  %26 = tail call float @llvm.fmuladd.f32(float %24, float %25, float 0xBFC55553A0000000)
  %27 = fmul float %24, %26
  %28 = tail call float @llvm.fmuladd.f32(float %21, float %27, float %21)
  %29 = tail call float @llvm.fmuladd.f32(float %24, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %30 = tail call float @llvm.fmuladd.f32(float %24, float %29, float 0x3FA5557EE0000000)
  %31 = tail call float @llvm.fmuladd.f32(float %24, float %30, float 0xBFE0000080000000)
  %32 = tail call float @llvm.fmuladd.f32(float %24, float %31, float 1.000000e+00)
  %33 = and i32 %22, 1
  %34 = icmp eq i32 %33, 0
  %35 = select i1 %34, float %28, float %32
  %36 = bitcast float %35 to i32
  %37 = shl i32 %22, 30
  %38 = and i32 %37, -2147483648
  %39 = bitcast float %13 to i32
  %40 = xor i32 %23, %39
  %41 = xor i32 %40, %36
  %42 = xor i32 %41, %38
  %43 = bitcast i32 %42 to float
  %44 = tail call i1 @llvm.amdgcn.class.f32(float %14, i32 504)
  %45 = select i1 %44, float %43, float 0x7FF8000000000000
  br label %174

46:                                               ; preds = %2
  %47 = bitcast float %14 to i32
  %48 = lshr i32 %47, 23
  %49 = and i32 %47, 8388607
  %50 = or i32 %49, 8388608
  %51 = zext i32 %50 to i64
  %52 = mul nuw nsw i64 %51, 4266746795
  %53 = trunc i64 %52 to i32
  %54 = lshr i64 %52, 32
  %55 = mul nuw nsw i64 %51, 1011060801
  %56 = add nuw nsw i64 %54, %55
  %57 = trunc i64 %56 to i32
  %58 = lshr i64 %56, 32
  %59 = mul nuw nsw i64 %51, 3680671129
  %60 = add nuw nsw i64 %58, %59
  %61 = trunc i64 %60 to i32
  %62 = lshr i64 %60, 32
  %63 = mul nuw nsw i64 %51, 4113882560
  %64 = add nuw nsw i64 %62, %63
  %65 = trunc i64 %64 to i32
  %66 = lshr i64 %64, 32
  %67 = mul nuw nsw i64 %51, 4230436817
  %68 = add nuw nsw i64 %66, %67
  %69 = trunc i64 %68 to i32
  %70 = lshr i64 %68, 32
  %71 = mul nuw nsw i64 %51, 1313084713
  %72 = add nuw nsw i64 %70, %71
  %73 = trunc i64 %72 to i32
  %74 = lshr i64 %72, 32
  %75 = mul nuw nsw i64 %51, 2734261102
  %76 = add nuw nsw i64 %74, %75
  %77 = trunc i64 %76 to i32
  %78 = lshr i64 %76, 32
  %79 = trunc i64 %78 to i32
  %80 = add nsw i32 %48, -120
  %81 = icmp ugt i32 %80, 63
  %82 = select i1 %81, i32 %73, i32 %79
  %83 = select i1 %81, i32 %69, i32 %77
  %84 = select i1 %81, i32 %65, i32 %73
  %85 = select i1 %81, i32 %61, i32 %69
  %86 = select i1 %81, i32 %57, i32 %65
  %87 = select i1 %81, i32 %53, i32 %61
  %88 = select i1 %81, i32 -64, i32 0
  %89 = add nsw i32 %88, %80
  %90 = icmp ugt i32 %89, 31
  %91 = select i1 %90, i32 %83, i32 %82
  %92 = select i1 %90, i32 %84, i32 %83
  %93 = select i1 %90, i32 %85, i32 %84
  %94 = select i1 %90, i32 %86, i32 %85
  %95 = select i1 %90, i32 %87, i32 %86
  %96 = select i1 %90, i32 -32, i32 0
  %97 = add nsw i32 %96, %89
  %98 = icmp ugt i32 %97, 31
  %99 = select i1 %98, i32 %92, i32 %91
  %100 = select i1 %98, i32 %93, i32 %92
  %101 = select i1 %98, i32 %94, i32 %93
  %102 = select i1 %98, i32 %95, i32 %94
  %103 = select i1 %98, i32 -32, i32 0
  %104 = add nsw i32 %103, %97
  %105 = icmp eq i32 %104, 0
  %106 = sub nsw i32 32, %104
  %107 = tail call i32 @llvm.fshr.i32(i32 %99, i32 %100, i32 %106)
  %108 = tail call i32 @llvm.fshr.i32(i32 %100, i32 %101, i32 %106)
  %109 = tail call i32 @llvm.fshr.i32(i32 %101, i32 %102, i32 %106)
  %110 = select i1 %105, i32 %99, i32 %107
  %111 = select i1 %105, i32 %100, i32 %108
  %112 = select i1 %105, i32 %101, i32 %109
  %113 = lshr i32 %110, 29
  %114 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %111, i32 2)
  %115 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %112, i32 2)
  %116 = tail call i32 @llvm.fshl.i32(i32 %112, i32 %102, i32 2)
  %117 = and i32 %113, 1
  %118 = sub nsw i32 0, %117
  %119 = shl i32 %113, 31
  %120 = xor i32 %114, %118
  %121 = xor i32 %115, %118
  %122 = xor i32 %116, %118
  %123 = tail call i32 @llvm.ctlz.i32(i32 %120, i1 false), !range !7
  %124 = sub nsw i32 31, %123
  %125 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %121, i32 %124)
  %126 = tail call i32 @llvm.fshr.i32(i32 %121, i32 %122, i32 %124)
  %127 = shl nuw nsw i32 %123, 23
  %128 = sub nuw nsw i32 1056964608, %127
  %129 = lshr i32 %125, 9
  %130 = or i32 %129, %128
  %131 = or i32 %130, %119
  %132 = bitcast i32 %131 to float
  %133 = tail call i32 @llvm.fshl.i32(i32 %125, i32 %126, i32 23)
  %134 = tail call i32 @llvm.ctlz.i32(i32 %133, i1 false), !range !7
  %135 = fmul float %132, 0x3FF921FB40000000
  %136 = add nuw nsw i32 %134, %123
  %137 = shl nuw nsw i32 %136, 23
  %138 = sub nuw nsw i32 855638016, %137
  %139 = sub nsw i32 31, %134
  %140 = tail call i32 @llvm.fshr.i32(i32 %133, i32 %126, i32 %139)
  %141 = lshr i32 %140, 9
  %142 = or i32 %138, %141
  %143 = or i32 %142, %119
  %144 = bitcast i32 %143 to float
  %145 = fneg float %135
  %146 = tail call float @llvm.fma.f32(float %132, float 0x3FF921FB40000000, float %145)
  %147 = tail call float @llvm.fma.f32(float %132, float 0x3E74442D00000000, float %146)
  %148 = tail call float @llvm.fma.f32(float %144, float 0x3FF921FB40000000, float %147)
  %149 = fadd float %135, %148
  %150 = lshr i32 %110, 30
  %151 = add nuw nsw i32 %117, %150
  %152 = fmul float %149, %149
  %153 = tail call float @llvm.fmuladd.f32(float %152, float 0xBF29833040000000, float 0x3F81103880000000)
  %154 = tail call float @llvm.fmuladd.f32(float %152, float %153, float 0xBFC55553A0000000)
  %155 = fmul float %152, %154
  %156 = tail call float @llvm.fmuladd.f32(float %149, float %155, float %149)
  %157 = tail call float @llvm.fmuladd.f32(float %152, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %158 = tail call float @llvm.fmuladd.f32(float %152, float %157, float 0x3FA5557EE0000000)
  %159 = tail call float @llvm.fmuladd.f32(float %152, float %158, float 0xBFE0000080000000)
  %160 = tail call float @llvm.fmuladd.f32(float %152, float %159, float 1.000000e+00)
  %161 = and i32 %151, 1
  %162 = icmp eq i32 %161, 0
  %163 = select i1 %162, float %156, float %160
  %164 = bitcast float %163 to i32
  %165 = shl i32 %151, 30
  %166 = and i32 %165, -2147483648
  %167 = bitcast float %13 to i32
  %168 = xor i32 %167, %164
  %169 = xor i32 %168, %166
  %170 = xor i32 %169, %47
  %171 = bitcast i32 %170 to float
  %172 = tail call i1 @llvm.amdgcn.class.f32(float %14, i32 504)
  %173 = select i1 %172, float %171, float 0x7FF8000000000000
  br label %174

174:                                              ; preds = %16, %46
  %175 = phi i32 [ %38, %16 ], [ %166, %46 ]
  %176 = phi i32 [ %33, %16 ], [ %161, %46 ]
  %177 = phi float [ %32, %16 ], [ %160, %46 ]
  %178 = phi float [ %28, %16 ], [ %156, %46 ]
  %179 = phi float [ %45, %16 ], [ %173, %46 ]
  %180 = phi i1 [ %44, %16 ], [ %172, %46 ]
  %181 = fneg float %178
  %182 = icmp eq i32 %176, 0
  %183 = select i1 %182, float %177, float %181
  %184 = bitcast float %183 to i32
  %185 = xor i32 %175, %184
  %186 = bitcast i32 %185 to float
  %187 = select i1 %180, float %186, float 0x7FF8000000000000
  %188 = sext i32 %12 to i64
  %189 = getelementptr inbounds float, float addrspace(1)* %0, i64 %188
  %190 = load float, float addrspace(1)* %189, align 4, !tbaa !8, !amdgpu.noclobber !6
  %191 = fmul contract float %179, %179
  %192 = fmul contract float %187, %187
  %193 = fadd contract float %191, %192
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
  %215 = fadd contract float %190, %214
  store float %215, float addrspace(1)* %189, align 4, !tbaa !8
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
!4 = !{i32 0, i32 1024}
!5 = !{i16 1, i16 1025}
!6 = !{}
!7 = !{i32 0, i32 33}
!8 = !{!9, !9, i64 0}
!9 = !{!"float", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
