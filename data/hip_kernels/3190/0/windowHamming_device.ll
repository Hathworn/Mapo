; ModuleID = '../data/hip_kernels/3190/0/main.cu'
source_filename = "../data/hip_kernels/3190/0/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly
define protected amdgpu_kernel void @_Z13windowHammingPfi(float addrspace(1)* nocapture writeonly %0, i32 %1) local_unnamed_addr #0 {
  %3 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %4 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %5 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %6 = getelementptr i8, i8 addrspace(4)* %5, i64 4
  %7 = bitcast i8 addrspace(4)* %6 to i16 addrspace(4)*
  %8 = load i16, i16 addrspace(4)* %7, align 4, !range !5, !invariant.load !6
  %9 = zext i16 %8 to i32
  %10 = mul i32 %4, %9
  %11 = add i32 %10, %3
  %12 = icmp slt i32 %11, %1
  br i1 %12, label %13, label %164

13:                                               ; preds = %2
  %14 = shl nsw i32 %11, 1
  %15 = sitofp i32 %14 to float
  %16 = fmul contract float %15, 0x400921FA00000000
  %17 = add nsw i32 %1, -1
  %18 = sitofp i32 %17 to float
  %19 = fdiv contract float %16, %18
  %20 = tail call float @llvm.fabs.f32(float %19)
  %21 = fcmp olt float %20, 1.310720e+05
  br i1 %21, label %22, label %29

22:                                               ; preds = %13
  %23 = fmul float %20, 0x3FE45F3060000000
  %24 = tail call float @llvm.rint.f32(float %23)
  %25 = tail call float @llvm.fma.f32(float %24, float 0xBFF921FB40000000, float %20)
  %26 = tail call float @llvm.fma.f32(float %24, float 0xBE74442D00000000, float %25)
  %27 = tail call float @llvm.fma.f32(float %24, float 0xBCF8469880000000, float %26)
  %28 = fptosi float %24 to i32
  br label %135

29:                                               ; preds = %13
  %30 = bitcast float %20 to i32
  %31 = lshr i32 %30, 23
  %32 = and i32 %30, 8388607
  %33 = or i32 %32, 8388608
  %34 = zext i32 %33 to i64
  %35 = mul nuw nsw i64 %34, 4266746795
  %36 = trunc i64 %35 to i32
  %37 = lshr i64 %35, 32
  %38 = mul nuw nsw i64 %34, 1011060801
  %39 = add nuw nsw i64 %37, %38
  %40 = trunc i64 %39 to i32
  %41 = lshr i64 %39, 32
  %42 = mul nuw nsw i64 %34, 3680671129
  %43 = add nuw nsw i64 %41, %42
  %44 = trunc i64 %43 to i32
  %45 = lshr i64 %43, 32
  %46 = mul nuw nsw i64 %34, 4113882560
  %47 = add nuw nsw i64 %45, %46
  %48 = trunc i64 %47 to i32
  %49 = lshr i64 %47, 32
  %50 = mul nuw nsw i64 %34, 4230436817
  %51 = add nuw nsw i64 %49, %50
  %52 = trunc i64 %51 to i32
  %53 = lshr i64 %51, 32
  %54 = mul nuw nsw i64 %34, 1313084713
  %55 = add nuw nsw i64 %53, %54
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %55, 32
  %58 = mul nuw nsw i64 %34, 2734261102
  %59 = add nuw nsw i64 %57, %58
  %60 = trunc i64 %59 to i32
  %61 = lshr i64 %59, 32
  %62 = trunc i64 %61 to i32
  %63 = add nsw i32 %31, -120
  %64 = icmp ugt i32 %63, 63
  %65 = select i1 %64, i32 %56, i32 %62
  %66 = select i1 %64, i32 %52, i32 %60
  %67 = select i1 %64, i32 %48, i32 %56
  %68 = select i1 %64, i32 %44, i32 %52
  %69 = select i1 %64, i32 %40, i32 %48
  %70 = select i1 %64, i32 %36, i32 %44
  %71 = select i1 %64, i32 -64, i32 0
  %72 = add nsw i32 %71, %63
  %73 = icmp ugt i32 %72, 31
  %74 = select i1 %73, i32 %66, i32 %65
  %75 = select i1 %73, i32 %67, i32 %66
  %76 = select i1 %73, i32 %68, i32 %67
  %77 = select i1 %73, i32 %69, i32 %68
  %78 = select i1 %73, i32 %70, i32 %69
  %79 = select i1 %73, i32 -32, i32 0
  %80 = add nsw i32 %79, %72
  %81 = icmp ugt i32 %80, 31
  %82 = select i1 %81, i32 %75, i32 %74
  %83 = select i1 %81, i32 %76, i32 %75
  %84 = select i1 %81, i32 %77, i32 %76
  %85 = select i1 %81, i32 %78, i32 %77
  %86 = select i1 %81, i32 -32, i32 0
  %87 = add nsw i32 %86, %80
  %88 = icmp eq i32 %87, 0
  %89 = sub nsw i32 32, %87
  %90 = tail call i32 @llvm.fshr.i32(i32 %82, i32 %83, i32 %89)
  %91 = tail call i32 @llvm.fshr.i32(i32 %83, i32 %84, i32 %89)
  %92 = tail call i32 @llvm.fshr.i32(i32 %84, i32 %85, i32 %89)
  %93 = select i1 %88, i32 %82, i32 %90
  %94 = select i1 %88, i32 %83, i32 %91
  %95 = select i1 %88, i32 %84, i32 %92
  %96 = lshr i32 %93, 29
  %97 = tail call i32 @llvm.fshl.i32(i32 %93, i32 %94, i32 2)
  %98 = tail call i32 @llvm.fshl.i32(i32 %94, i32 %95, i32 2)
  %99 = tail call i32 @llvm.fshl.i32(i32 %95, i32 %85, i32 2)
  %100 = and i32 %96, 1
  %101 = sub nsw i32 0, %100
  %102 = shl i32 %96, 31
  %103 = xor i32 %97, %101
  %104 = xor i32 %98, %101
  %105 = xor i32 %99, %101
  %106 = tail call i32 @llvm.ctlz.i32(i32 %103, i1 false), !range !7
  %107 = sub nsw i32 31, %106
  %108 = tail call i32 @llvm.fshr.i32(i32 %103, i32 %104, i32 %107)
  %109 = tail call i32 @llvm.fshr.i32(i32 %104, i32 %105, i32 %107)
  %110 = shl nuw nsw i32 %106, 23
  %111 = sub nuw nsw i32 1056964608, %110
  %112 = lshr i32 %108, 9
  %113 = or i32 %112, %111
  %114 = or i32 %113, %102
  %115 = bitcast i32 %114 to float
  %116 = tail call i32 @llvm.fshl.i32(i32 %108, i32 %109, i32 23)
  %117 = tail call i32 @llvm.ctlz.i32(i32 %116, i1 false), !range !7
  %118 = fmul float %115, 0x3FF921FB40000000
  %119 = add nuw nsw i32 %117, %106
  %120 = shl nuw nsw i32 %119, 23
  %121 = sub nuw nsw i32 855638016, %120
  %122 = sub nsw i32 31, %117
  %123 = tail call i32 @llvm.fshr.i32(i32 %116, i32 %109, i32 %122)
  %124 = lshr i32 %123, 9
  %125 = or i32 %121, %124
  %126 = or i32 %125, %102
  %127 = bitcast i32 %126 to float
  %128 = fneg float %118
  %129 = tail call float @llvm.fma.f32(float %115, float 0x3FF921FB40000000, float %128)
  %130 = tail call float @llvm.fma.f32(float %115, float 0x3E74442D00000000, float %129)
  %131 = tail call float @llvm.fma.f32(float %127, float 0x3FF921FB40000000, float %130)
  %132 = fadd float %118, %131
  %133 = lshr i32 %93, 30
  %134 = add nuw nsw i32 %100, %133
  br label %135

135:                                              ; preds = %22, %29
  %136 = phi float [ %27, %22 ], [ %132, %29 ]
  %137 = phi i32 [ %28, %22 ], [ %134, %29 ]
  %138 = fmul float %136, %136
  %139 = tail call float @llvm.fmuladd.f32(float %138, float 0xBF29833040000000, float 0x3F81103880000000)
  %140 = tail call float @llvm.fmuladd.f32(float %138, float %139, float 0xBFC55553A0000000)
  %141 = fmul float %138, %140
  %142 = tail call float @llvm.fmuladd.f32(float %136, float %141, float %136)
  %143 = tail call float @llvm.fmuladd.f32(float %138, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %144 = tail call float @llvm.fmuladd.f32(float %138, float %143, float 0x3FA5557EE0000000)
  %145 = tail call float @llvm.fmuladd.f32(float %138, float %144, float 0xBFE0000080000000)
  %146 = tail call float @llvm.fmuladd.f32(float %138, float %145, float 1.000000e+00)
  %147 = fneg float %142
  %148 = and i32 %137, 1
  %149 = icmp eq i32 %148, 0
  %150 = select i1 %149, float %146, float %147
  %151 = bitcast float %150 to i32
  %152 = shl i32 %137, 30
  %153 = and i32 %152, -2147483648
  %154 = xor i32 %153, %151
  %155 = bitcast i32 %154 to float
  %156 = tail call i1 @llvm.amdgcn.class.f32(float %20, i32 504)
  %157 = fpext float %155 to double
  %158 = fmul contract double %157, 4.600000e-01
  %159 = fsub contract double 5.400000e-01, %158
  %160 = fptrunc double %159 to float
  %161 = select i1 %156, float %160, float 0x7FF8000000000000
  %162 = sext i32 %11 to i64
  %163 = getelementptr inbounds float, float addrspace(1)* %0, i64 %162
  store float %161, float addrspace(1)* %163, align 4, !tbaa !8
  br label %164

164:                                              ; preds = %135, %2
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

attributes #0 = { argmemonly mustprogress nofree norecurse nosync nounwind willreturn writeonly "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
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
