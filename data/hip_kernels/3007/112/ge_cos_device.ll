; ModuleID = '../data/hip_kernels/3007/112/main.cu'
source_filename = "../data/hip_kernels/3007/112/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z6ge_cosiiPKfiiPfii(i32 %0, i32 %1, float addrspace(1)* nocapture readonly %2, i32 %3, i32 %4, float addrspace(1)* nocapture writeonly %5, i32 %6, i32 %7) local_unnamed_addr #0 {
  %9 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %10 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %11 = getelementptr i8, i8 addrspace(4)* %10, i64 4
  %12 = bitcast i8 addrspace(4)* %11 to i16 addrspace(4)*
  %13 = load i16, i16 addrspace(4)* %12, align 4, !range !4, !invariant.load !5
  %14 = zext i16 %13 to i32
  %15 = mul i32 %9, %14
  %16 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %17 = add i32 %15, %16
  %18 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %19 = getelementptr i8, i8 addrspace(4)* %10, i64 6
  %20 = bitcast i8 addrspace(4)* %19 to i16 addrspace(4)*
  %21 = load i16, i16 addrspace(4)* %20, align 2, !range !4, !invariant.load !5
  %22 = zext i16 %21 to i32
  %23 = mul i32 %18, %22
  %24 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %25 = add i32 %23, %24
  %26 = icmp slt i32 %17, %0
  %27 = icmp slt i32 %25, %1
  %28 = select i1 %26, i1 %27, i1 false
  br i1 %28, label %29, label %179

29:                                               ; preds = %8
  %30 = add nsw i32 %17, %3
  %31 = mul nsw i32 %25, %4
  %32 = add nsw i32 %30, %31
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds float, float addrspace(1)* %2, i64 %33
  %35 = load float, float addrspace(1)* %34, align 4, !tbaa !7, !amdgpu.noclobber !5
  %36 = tail call float @llvm.fabs.f32(float %35)
  %37 = fcmp olt float %36, 1.310720e+05
  br i1 %37, label %38, label %45

38:                                               ; preds = %29
  %39 = fmul float %36, 0x3FE45F3060000000
  %40 = tail call float @llvm.rint.f32(float %39)
  %41 = tail call float @llvm.fma.f32(float %40, float 0xBFF921FB40000000, float %36)
  %42 = tail call float @llvm.fma.f32(float %40, float 0xBE74442D00000000, float %41)
  %43 = tail call float @llvm.fma.f32(float %40, float 0xBCF8469880000000, float %42)
  %44 = fptosi float %40 to i32
  br label %151

45:                                               ; preds = %29
  %46 = bitcast float %36 to i32
  %47 = lshr i32 %46, 23
  %48 = and i32 %46, 8388607
  %49 = or i32 %48, 8388608
  %50 = zext i32 %49 to i64
  %51 = mul nuw nsw i64 %50, 4266746795
  %52 = trunc i64 %51 to i32
  %53 = lshr i64 %51, 32
  %54 = mul nuw nsw i64 %50, 1011060801
  %55 = add nuw nsw i64 %53, %54
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %55, 32
  %58 = mul nuw nsw i64 %50, 3680671129
  %59 = add nuw nsw i64 %57, %58
  %60 = trunc i64 %59 to i32
  %61 = lshr i64 %59, 32
  %62 = mul nuw nsw i64 %50, 4113882560
  %63 = add nuw nsw i64 %61, %62
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %63, 32
  %66 = mul nuw nsw i64 %50, 4230436817
  %67 = add nuw nsw i64 %65, %66
  %68 = trunc i64 %67 to i32
  %69 = lshr i64 %67, 32
  %70 = mul nuw nsw i64 %50, 1313084713
  %71 = add nuw nsw i64 %69, %70
  %72 = trunc i64 %71 to i32
  %73 = lshr i64 %71, 32
  %74 = mul nuw nsw i64 %50, 2734261102
  %75 = add nuw nsw i64 %73, %74
  %76 = trunc i64 %75 to i32
  %77 = lshr i64 %75, 32
  %78 = trunc i64 %77 to i32
  %79 = add nsw i32 %47, -120
  %80 = icmp ugt i32 %79, 63
  %81 = select i1 %80, i32 %72, i32 %78
  %82 = select i1 %80, i32 %68, i32 %76
  %83 = select i1 %80, i32 %64, i32 %72
  %84 = select i1 %80, i32 %60, i32 %68
  %85 = select i1 %80, i32 %56, i32 %64
  %86 = select i1 %80, i32 %52, i32 %60
  %87 = select i1 %80, i32 -64, i32 0
  %88 = add nsw i32 %87, %79
  %89 = icmp ugt i32 %88, 31
  %90 = select i1 %89, i32 %82, i32 %81
  %91 = select i1 %89, i32 %83, i32 %82
  %92 = select i1 %89, i32 %84, i32 %83
  %93 = select i1 %89, i32 %85, i32 %84
  %94 = select i1 %89, i32 %86, i32 %85
  %95 = select i1 %89, i32 -32, i32 0
  %96 = add nsw i32 %95, %88
  %97 = icmp ugt i32 %96, 31
  %98 = select i1 %97, i32 %91, i32 %90
  %99 = select i1 %97, i32 %92, i32 %91
  %100 = select i1 %97, i32 %93, i32 %92
  %101 = select i1 %97, i32 %94, i32 %93
  %102 = select i1 %97, i32 -32, i32 0
  %103 = add nsw i32 %102, %96
  %104 = icmp eq i32 %103, 0
  %105 = sub nsw i32 32, %103
  %106 = tail call i32 @llvm.fshr.i32(i32 %98, i32 %99, i32 %105)
  %107 = tail call i32 @llvm.fshr.i32(i32 %99, i32 %100, i32 %105)
  %108 = tail call i32 @llvm.fshr.i32(i32 %100, i32 %101, i32 %105)
  %109 = select i1 %104, i32 %98, i32 %106
  %110 = select i1 %104, i32 %99, i32 %107
  %111 = select i1 %104, i32 %100, i32 %108
  %112 = lshr i32 %109, 29
  %113 = tail call i32 @llvm.fshl.i32(i32 %109, i32 %110, i32 2)
  %114 = tail call i32 @llvm.fshl.i32(i32 %110, i32 %111, i32 2)
  %115 = tail call i32 @llvm.fshl.i32(i32 %111, i32 %101, i32 2)
  %116 = and i32 %112, 1
  %117 = sub nsw i32 0, %116
  %118 = shl i32 %112, 31
  %119 = xor i32 %113, %117
  %120 = xor i32 %114, %117
  %121 = xor i32 %115, %117
  %122 = tail call i32 @llvm.ctlz.i32(i32 %119, i1 false), !range !11
  %123 = sub nsw i32 31, %122
  %124 = tail call i32 @llvm.fshr.i32(i32 %119, i32 %120, i32 %123)
  %125 = tail call i32 @llvm.fshr.i32(i32 %120, i32 %121, i32 %123)
  %126 = shl nuw nsw i32 %122, 23
  %127 = sub nuw nsw i32 1056964608, %126
  %128 = lshr i32 %124, 9
  %129 = or i32 %128, %127
  %130 = or i32 %129, %118
  %131 = bitcast i32 %130 to float
  %132 = tail call i32 @llvm.fshl.i32(i32 %124, i32 %125, i32 23)
  %133 = tail call i32 @llvm.ctlz.i32(i32 %132, i1 false), !range !11
  %134 = fmul float %131, 0x3FF921FB40000000
  %135 = add nuw nsw i32 %133, %122
  %136 = shl nuw nsw i32 %135, 23
  %137 = sub nuw nsw i32 855638016, %136
  %138 = sub nsw i32 31, %133
  %139 = tail call i32 @llvm.fshr.i32(i32 %132, i32 %125, i32 %138)
  %140 = lshr i32 %139, 9
  %141 = or i32 %137, %140
  %142 = or i32 %141, %118
  %143 = bitcast i32 %142 to float
  %144 = fneg float %134
  %145 = tail call float @llvm.fma.f32(float %131, float 0x3FF921FB40000000, float %144)
  %146 = tail call float @llvm.fma.f32(float %131, float 0x3E74442D00000000, float %145)
  %147 = tail call float @llvm.fma.f32(float %143, float 0x3FF921FB40000000, float %146)
  %148 = fadd float %134, %147
  %149 = lshr i32 %109, 30
  %150 = add nuw nsw i32 %116, %149
  br label %151

151:                                              ; preds = %38, %45
  %152 = phi float [ %43, %38 ], [ %148, %45 ]
  %153 = phi i32 [ %44, %38 ], [ %150, %45 ]
  %154 = fmul float %152, %152
  %155 = tail call float @llvm.fmuladd.f32(float %154, float 0xBF29833040000000, float 0x3F81103880000000)
  %156 = tail call float @llvm.fmuladd.f32(float %154, float %155, float 0xBFC55553A0000000)
  %157 = fmul float %154, %156
  %158 = tail call float @llvm.fmuladd.f32(float %152, float %157, float %152)
  %159 = tail call float @llvm.fmuladd.f32(float %154, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %160 = tail call float @llvm.fmuladd.f32(float %154, float %159, float 0x3FA5557EE0000000)
  %161 = tail call float @llvm.fmuladd.f32(float %154, float %160, float 0xBFE0000080000000)
  %162 = tail call float @llvm.fmuladd.f32(float %154, float %161, float 1.000000e+00)
  %163 = fneg float %158
  %164 = and i32 %153, 1
  %165 = icmp eq i32 %164, 0
  %166 = select i1 %165, float %162, float %163
  %167 = bitcast float %166 to i32
  %168 = shl i32 %153, 30
  %169 = and i32 %168, -2147483648
  %170 = xor i32 %169, %167
  %171 = bitcast i32 %170 to float
  %172 = tail call i1 @llvm.amdgcn.class.f32(float %36, i32 504)
  %173 = select i1 %172, float %171, float 0x7FF8000000000000
  %174 = add nsw i32 %17, %6
  %175 = mul nsw i32 %25, %7
  %176 = add nsw i32 %174, %175
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds float, float addrspace(1)* %5, i64 %177
  store float %173, float addrspace(1)* %178, align 4, !tbaa !7
  br label %179

179:                                              ; preds = %151, %8
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
declare i32 @llvm.amdgcn.workitem.id.y() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.y() #2

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
