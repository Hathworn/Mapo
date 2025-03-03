; ModuleID = '../data/hip_kernels/24/4/main.cu'
source_filename = "../data/hip_kernels/24/4/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z12factorKernelPfi(float addrspace(1)* nocapture %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %4 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %5 = getelementptr i8, i8 addrspace(4)* %4, i64 4
  %6 = bitcast i8 addrspace(4)* %5 to i16 addrspace(4)*
  %7 = load i16, i16 addrspace(4)* %6, align 4, !range !4, !invariant.load !5
  %8 = zext i16 %7 to i32
  %9 = mul i32 %3, %8
  %10 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %11 = add i32 %9, %10
  %12 = shl nsw i32 %11, 1
  %13 = add nsw i32 %12, %1
  %14 = sitofp i32 %1 to float
  %15 = fdiv contract float 0x401921CAC0000000, %14
  %16 = sitofp i32 %11 to float
  %17 = fmul contract float %15, %16
  %18 = icmp slt i32 %12, %1
  br i1 %18, label %19, label %208

19:                                               ; preds = %2
  %20 = tail call float @llvm.fabs.f32(float %17)
  %21 = fcmp olt float %20, 1.310720e+05
  br i1 %21, label %22, label %52

22:                                               ; preds = %19
  %23 = fmul float %20, 0x3FE45F3060000000
  %24 = tail call float @llvm.rint.f32(float %23)
  %25 = tail call float @llvm.fma.f32(float %24, float 0xBFF921FB40000000, float %20)
  %26 = tail call float @llvm.fma.f32(float %24, float 0xBE74442D00000000, float %25)
  %27 = tail call float @llvm.fma.f32(float %24, float 0xBCF8469880000000, float %26)
  %28 = fptosi float %24 to i32
  %29 = fmul float %27, %27
  %30 = tail call float @llvm.fmuladd.f32(float %29, float 0xBF29833040000000, float 0x3F81103880000000)
  %31 = tail call float @llvm.fmuladd.f32(float %29, float %30, float 0xBFC55553A0000000)
  %32 = fmul float %29, %31
  %33 = tail call float @llvm.fmuladd.f32(float %27, float %32, float %27)
  %34 = tail call float @llvm.fmuladd.f32(float %29, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %35 = tail call float @llvm.fmuladd.f32(float %29, float %34, float 0x3FA5557EE0000000)
  %36 = tail call float @llvm.fmuladd.f32(float %29, float %35, float 0xBFE0000080000000)
  %37 = tail call float @llvm.fmuladd.f32(float %29, float %36, float 1.000000e+00)
  %38 = fneg float %33
  %39 = and i32 %28, 1
  %40 = icmp eq i32 %39, 0
  %41 = select i1 %40, float %37, float %38
  %42 = bitcast float %41 to i32
  %43 = shl i32 %28, 30
  %44 = and i32 %43, -2147483648
  %45 = xor i32 %44, %42
  %46 = bitcast i32 %45 to float
  %47 = tail call i1 @llvm.amdgcn.class.f32(float %20, i32 504)
  %48 = select i1 %47, float %46, float 0x7FF8000000000000
  %49 = sext i32 %12 to i64
  %50 = getelementptr inbounds float, float addrspace(1)* %0, i64 %49
  store float %48, float addrspace(1)* %50, align 4, !tbaa !7
  %51 = bitcast float %20 to i32
  br label %180

52:                                               ; preds = %19
  %53 = bitcast float %20 to i32
  %54 = lshr i32 %53, 23
  %55 = and i32 %53, 8388607
  %56 = or i32 %55, 8388608
  %57 = zext i32 %56 to i64
  %58 = mul nuw nsw i64 %57, 4266746795
  %59 = trunc i64 %58 to i32
  %60 = lshr i64 %58, 32
  %61 = mul nuw nsw i64 %57, 1011060801
  %62 = add nuw nsw i64 %60, %61
  %63 = trunc i64 %62 to i32
  %64 = lshr i64 %62, 32
  %65 = mul nuw nsw i64 %57, 3680671129
  %66 = add nuw nsw i64 %64, %65
  %67 = trunc i64 %66 to i32
  %68 = lshr i64 %66, 32
  %69 = mul nuw nsw i64 %57, 4113882560
  %70 = add nuw nsw i64 %68, %69
  %71 = trunc i64 %70 to i32
  %72 = lshr i64 %70, 32
  %73 = mul nuw nsw i64 %57, 4230436817
  %74 = add nuw nsw i64 %72, %73
  %75 = trunc i64 %74 to i32
  %76 = lshr i64 %74, 32
  %77 = mul nuw nsw i64 %57, 1313084713
  %78 = add nuw nsw i64 %76, %77
  %79 = trunc i64 %78 to i32
  %80 = lshr i64 %78, 32
  %81 = mul nuw nsw i64 %57, 2734261102
  %82 = add nuw nsw i64 %80, %81
  %83 = trunc i64 %82 to i32
  %84 = lshr i64 %82, 32
  %85 = trunc i64 %84 to i32
  %86 = add nsw i32 %54, -120
  %87 = icmp ugt i32 %86, 63
  %88 = select i1 %87, i32 %79, i32 %85
  %89 = select i1 %87, i32 %75, i32 %83
  %90 = select i1 %87, i32 %71, i32 %79
  %91 = select i1 %87, i32 %67, i32 %75
  %92 = select i1 %87, i32 %63, i32 %71
  %93 = select i1 %87, i32 %59, i32 %67
  %94 = select i1 %87, i32 -64, i32 0
  %95 = add nsw i32 %94, %86
  %96 = icmp ugt i32 %95, 31
  %97 = select i1 %96, i32 %89, i32 %88
  %98 = select i1 %96, i32 %90, i32 %89
  %99 = select i1 %96, i32 %91, i32 %90
  %100 = select i1 %96, i32 %92, i32 %91
  %101 = select i1 %96, i32 %93, i32 %92
  %102 = select i1 %96, i32 -32, i32 0
  %103 = add nsw i32 %102, %95
  %104 = icmp ugt i32 %103, 31
  %105 = select i1 %104, i32 %98, i32 %97
  %106 = select i1 %104, i32 %99, i32 %98
  %107 = select i1 %104, i32 %100, i32 %99
  %108 = select i1 %104, i32 %101, i32 %100
  %109 = select i1 %104, i32 -32, i32 0
  %110 = add nsw i32 %109, %103
  %111 = icmp eq i32 %110, 0
  %112 = sub nsw i32 32, %110
  %113 = tail call i32 @llvm.fshr.i32(i32 %105, i32 %106, i32 %112)
  %114 = tail call i32 @llvm.fshr.i32(i32 %106, i32 %107, i32 %112)
  %115 = tail call i32 @llvm.fshr.i32(i32 %107, i32 %108, i32 %112)
  %116 = select i1 %111, i32 %105, i32 %113
  %117 = select i1 %111, i32 %106, i32 %114
  %118 = select i1 %111, i32 %107, i32 %115
  %119 = lshr i32 %116, 29
  %120 = tail call i32 @llvm.fshl.i32(i32 %116, i32 %117, i32 2)
  %121 = tail call i32 @llvm.fshl.i32(i32 %117, i32 %118, i32 2)
  %122 = tail call i32 @llvm.fshl.i32(i32 %118, i32 %108, i32 2)
  %123 = and i32 %119, 1
  %124 = sub nsw i32 0, %123
  %125 = shl i32 %119, 31
  %126 = xor i32 %120, %124
  %127 = xor i32 %121, %124
  %128 = xor i32 %122, %124
  %129 = tail call i32 @llvm.ctlz.i32(i32 %126, i1 false), !range !11
  %130 = sub nsw i32 31, %129
  %131 = tail call i32 @llvm.fshr.i32(i32 %126, i32 %127, i32 %130)
  %132 = tail call i32 @llvm.fshr.i32(i32 %127, i32 %128, i32 %130)
  %133 = shl nuw nsw i32 %129, 23
  %134 = sub nuw nsw i32 1056964608, %133
  %135 = lshr i32 %131, 9
  %136 = or i32 %135, %134
  %137 = or i32 %136, %125
  %138 = bitcast i32 %137 to float
  %139 = tail call i32 @llvm.fshl.i32(i32 %131, i32 %132, i32 23)
  %140 = tail call i32 @llvm.ctlz.i32(i32 %139, i1 false), !range !11
  %141 = fmul float %138, 0x3FF921FB40000000
  %142 = add nuw nsw i32 %140, %129
  %143 = shl nuw nsw i32 %142, 23
  %144 = sub nuw nsw i32 855638016, %143
  %145 = sub nsw i32 31, %140
  %146 = tail call i32 @llvm.fshr.i32(i32 %139, i32 %132, i32 %145)
  %147 = lshr i32 %146, 9
  %148 = or i32 %144, %147
  %149 = or i32 %148, %125
  %150 = bitcast i32 %149 to float
  %151 = fneg float %141
  %152 = tail call float @llvm.fma.f32(float %138, float 0x3FF921FB40000000, float %151)
  %153 = tail call float @llvm.fma.f32(float %138, float 0x3E74442D00000000, float %152)
  %154 = tail call float @llvm.fma.f32(float %150, float 0x3FF921FB40000000, float %153)
  %155 = fadd float %141, %154
  %156 = lshr i32 %116, 30
  %157 = add nuw nsw i32 %123, %156
  %158 = fmul float %155, %155
  %159 = tail call float @llvm.fmuladd.f32(float %158, float 0xBF29833040000000, float 0x3F81103880000000)
  %160 = tail call float @llvm.fmuladd.f32(float %158, float %159, float 0xBFC55553A0000000)
  %161 = fmul float %158, %160
  %162 = tail call float @llvm.fmuladd.f32(float %155, float %161, float %155)
  %163 = tail call float @llvm.fmuladd.f32(float %158, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %164 = tail call float @llvm.fmuladd.f32(float %158, float %163, float 0x3FA5557EE0000000)
  %165 = tail call float @llvm.fmuladd.f32(float %158, float %164, float 0xBFE0000080000000)
  %166 = tail call float @llvm.fmuladd.f32(float %158, float %165, float 1.000000e+00)
  %167 = fneg float %162
  %168 = and i32 %157, 1
  %169 = icmp eq i32 %168, 0
  %170 = select i1 %169, float %166, float %167
  %171 = bitcast float %170 to i32
  %172 = shl i32 %157, 30
  %173 = and i32 %172, -2147483648
  %174 = xor i32 %173, %171
  %175 = bitcast i32 %174 to float
  %176 = tail call i1 @llvm.amdgcn.class.f32(float %20, i32 504)
  %177 = select i1 %176, float %175, float 0x7FF8000000000000
  %178 = sext i32 %12 to i64
  %179 = getelementptr inbounds float, float addrspace(1)* %0, i64 %178
  store float %177, float addrspace(1)* %179, align 4, !tbaa !7
  br label %180

180:                                              ; preds = %22, %52
  %181 = phi i32 [ %44, %22 ], [ %173, %52 ]
  %182 = phi i32 [ %39, %22 ], [ %168, %52 ]
  %183 = phi float [ %37, %22 ], [ %166, %52 ]
  %184 = phi float [ %33, %22 ], [ %162, %52 ]
  %185 = phi float [ %48, %22 ], [ %177, %52 ]
  %186 = phi i1 [ %47, %22 ], [ %176, %52 ]
  %187 = phi i32 [ %51, %22 ], [ %53, %52 ]
  %188 = icmp eq i32 %182, 0
  %189 = select i1 %188, float %184, float %183
  %190 = bitcast float %189 to i32
  %191 = bitcast float %17 to i32
  %192 = xor i32 %187, %191
  %193 = xor i32 %192, %181
  %194 = xor i32 %193, %190
  %195 = bitcast i32 %194 to float
  %196 = select i1 %186, float %195, float 0x7FF8000000000000
  %197 = add nuw nsw i32 %12, 1
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds float, float addrspace(1)* %0, i64 %198
  store float %196, float addrspace(1)* %199, align 4, !tbaa !7
  %200 = fneg contract float %185
  %201 = sext i32 %13 to i64
  %202 = getelementptr inbounds float, float addrspace(1)* %0, i64 %201
  store float %200, float addrspace(1)* %202, align 4, !tbaa !7
  %203 = load float, float addrspace(1)* %199, align 4, !tbaa !7
  %204 = fneg contract float %203
  %205 = add nsw i32 %13, 1
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds float, float addrspace(1)* %0, i64 %206
  store float %204, float addrspace(1)* %207, align 4, !tbaa !7
  br label %208

208:                                              ; preds = %180, %2
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
