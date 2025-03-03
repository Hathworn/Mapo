; ModuleID = '../data/hip_kernels/8192/237/main.cu'
source_filename = "../data/hip_kernels/8192/237/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z16Matrix_sin_naivePKfiiPfi(float addrspace(1)* nocapture readonly %0, i32 %1, i32 %2, float addrspace(1)* nocapture writeonly %3, i32 %4) local_unnamed_addr #0 {
  %6 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %7 = getelementptr i8, i8 addrspace(4)* %6, i64 4
  %8 = bitcast i8 addrspace(4)* %7 to i16 addrspace(4)*
  %9 = load i16, i16 addrspace(4)* %8, align 4, !range !4, !invariant.load !5
  %10 = zext i16 %9 to i32
  %11 = getelementptr inbounds i8, i8 addrspace(4)* %6, i64 12
  %12 = bitcast i8 addrspace(4)* %11 to i32 addrspace(4)*
  %13 = load i32, i32 addrspace(4)* %12, align 4, !tbaa !6
  %14 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %15 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %16 = udiv i32 %13, %10
  %17 = mul i32 %16, %10
  %18 = icmp ugt i32 %13, %17
  %19 = zext i1 %18 to i32
  %20 = add i32 %16, %19
  %21 = mul i32 %20, %15
  %22 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !15
  %23 = add i32 %21, %14
  %24 = mul i32 %23, %10
  %25 = add i32 %24, %22
  %26 = icmp slt i32 %25, %4
  br i1 %26, label %27, label %174

27:                                               ; preds = %5
  %28 = sext i32 %25 to i64
  %29 = getelementptr inbounds float, float addrspace(1)* %0, i64 %28
  %30 = load float, float addrspace(1)* %29, align 4, !tbaa !16, !amdgpu.noclobber !5
  %31 = tail call float @llvm.fabs.f32(float %30)
  %32 = fcmp olt float %31, 1.310720e+05
  br i1 %32, label %33, label %41

33:                                               ; preds = %27
  %34 = fmul float %31, 0x3FE45F3060000000
  %35 = tail call float @llvm.rint.f32(float %34)
  %36 = tail call float @llvm.fma.f32(float %35, float 0xBFF921FB40000000, float %31)
  %37 = tail call float @llvm.fma.f32(float %35, float 0xBE74442D00000000, float %36)
  %38 = tail call float @llvm.fma.f32(float %35, float 0xBCF8469880000000, float %37)
  %39 = fptosi float %35 to i32
  %40 = bitcast float %31 to i32
  br label %147

41:                                               ; preds = %27
  %42 = bitcast float %31 to i32
  %43 = lshr i32 %42, 23
  %44 = and i32 %42, 8388607
  %45 = or i32 %44, 8388608
  %46 = zext i32 %45 to i64
  %47 = mul nuw nsw i64 %46, 4266746795
  %48 = trunc i64 %47 to i32
  %49 = lshr i64 %47, 32
  %50 = mul nuw nsw i64 %46, 1011060801
  %51 = add nuw nsw i64 %49, %50
  %52 = trunc i64 %51 to i32
  %53 = lshr i64 %51, 32
  %54 = mul nuw nsw i64 %46, 3680671129
  %55 = add nuw nsw i64 %53, %54
  %56 = trunc i64 %55 to i32
  %57 = lshr i64 %55, 32
  %58 = mul nuw nsw i64 %46, 4113882560
  %59 = add nuw nsw i64 %57, %58
  %60 = trunc i64 %59 to i32
  %61 = lshr i64 %59, 32
  %62 = mul nuw nsw i64 %46, 4230436817
  %63 = add nuw nsw i64 %61, %62
  %64 = trunc i64 %63 to i32
  %65 = lshr i64 %63, 32
  %66 = mul nuw nsw i64 %46, 1313084713
  %67 = add nuw nsw i64 %65, %66
  %68 = trunc i64 %67 to i32
  %69 = lshr i64 %67, 32
  %70 = mul nuw nsw i64 %46, 2734261102
  %71 = add nuw nsw i64 %69, %70
  %72 = trunc i64 %71 to i32
  %73 = lshr i64 %71, 32
  %74 = trunc i64 %73 to i32
  %75 = add nsw i32 %43, -120
  %76 = icmp ugt i32 %75, 63
  %77 = select i1 %76, i32 %68, i32 %74
  %78 = select i1 %76, i32 %64, i32 %72
  %79 = select i1 %76, i32 %60, i32 %68
  %80 = select i1 %76, i32 %56, i32 %64
  %81 = select i1 %76, i32 %52, i32 %60
  %82 = select i1 %76, i32 %48, i32 %56
  %83 = select i1 %76, i32 -64, i32 0
  %84 = add nsw i32 %83, %75
  %85 = icmp ugt i32 %84, 31
  %86 = select i1 %85, i32 %78, i32 %77
  %87 = select i1 %85, i32 %79, i32 %78
  %88 = select i1 %85, i32 %80, i32 %79
  %89 = select i1 %85, i32 %81, i32 %80
  %90 = select i1 %85, i32 %82, i32 %81
  %91 = select i1 %85, i32 -32, i32 0
  %92 = add nsw i32 %91, %84
  %93 = icmp ugt i32 %92, 31
  %94 = select i1 %93, i32 %87, i32 %86
  %95 = select i1 %93, i32 %88, i32 %87
  %96 = select i1 %93, i32 %89, i32 %88
  %97 = select i1 %93, i32 %90, i32 %89
  %98 = select i1 %93, i32 -32, i32 0
  %99 = add nsw i32 %98, %92
  %100 = icmp eq i32 %99, 0
  %101 = sub nsw i32 32, %99
  %102 = tail call i32 @llvm.fshr.i32(i32 %94, i32 %95, i32 %101)
  %103 = tail call i32 @llvm.fshr.i32(i32 %95, i32 %96, i32 %101)
  %104 = tail call i32 @llvm.fshr.i32(i32 %96, i32 %97, i32 %101)
  %105 = select i1 %100, i32 %94, i32 %102
  %106 = select i1 %100, i32 %95, i32 %103
  %107 = select i1 %100, i32 %96, i32 %104
  %108 = lshr i32 %105, 29
  %109 = tail call i32 @llvm.fshl.i32(i32 %105, i32 %106, i32 2)
  %110 = tail call i32 @llvm.fshl.i32(i32 %106, i32 %107, i32 2)
  %111 = tail call i32 @llvm.fshl.i32(i32 %107, i32 %97, i32 2)
  %112 = and i32 %108, 1
  %113 = sub nsw i32 0, %112
  %114 = shl i32 %108, 31
  %115 = xor i32 %109, %113
  %116 = xor i32 %110, %113
  %117 = xor i32 %111, %113
  %118 = tail call i32 @llvm.ctlz.i32(i32 %115, i1 false), !range !20
  %119 = sub nsw i32 31, %118
  %120 = tail call i32 @llvm.fshr.i32(i32 %115, i32 %116, i32 %119)
  %121 = tail call i32 @llvm.fshr.i32(i32 %116, i32 %117, i32 %119)
  %122 = shl nuw nsw i32 %118, 23
  %123 = sub nuw nsw i32 1056964608, %122
  %124 = lshr i32 %120, 9
  %125 = or i32 %124, %123
  %126 = or i32 %125, %114
  %127 = bitcast i32 %126 to float
  %128 = tail call i32 @llvm.fshl.i32(i32 %120, i32 %121, i32 23)
  %129 = tail call i32 @llvm.ctlz.i32(i32 %128, i1 false), !range !20
  %130 = fmul float %127, 0x3FF921FB40000000
  %131 = add nuw nsw i32 %129, %118
  %132 = shl nuw nsw i32 %131, 23
  %133 = sub nuw nsw i32 855638016, %132
  %134 = sub nsw i32 31, %129
  %135 = tail call i32 @llvm.fshr.i32(i32 %128, i32 %121, i32 %134)
  %136 = lshr i32 %135, 9
  %137 = or i32 %133, %136
  %138 = or i32 %137, %114
  %139 = bitcast i32 %138 to float
  %140 = fneg float %130
  %141 = tail call float @llvm.fma.f32(float %127, float 0x3FF921FB40000000, float %140)
  %142 = tail call float @llvm.fma.f32(float %127, float 0x3E74442D00000000, float %141)
  %143 = tail call float @llvm.fma.f32(float %139, float 0x3FF921FB40000000, float %142)
  %144 = fadd float %130, %143
  %145 = lshr i32 %105, 30
  %146 = add nuw nsw i32 %112, %145
  br label %147

147:                                              ; preds = %33, %41
  %148 = phi i32 [ %40, %33 ], [ %42, %41 ]
  %149 = phi float [ %38, %33 ], [ %144, %41 ]
  %150 = phi i32 [ %39, %33 ], [ %146, %41 ]
  %151 = fmul float %149, %149
  %152 = tail call float @llvm.fmuladd.f32(float %151, float 0xBF29833040000000, float 0x3F81103880000000)
  %153 = tail call float @llvm.fmuladd.f32(float %151, float %152, float 0xBFC55553A0000000)
  %154 = fmul float %151, %153
  %155 = tail call float @llvm.fmuladd.f32(float %149, float %154, float %149)
  %156 = tail call float @llvm.fmuladd.f32(float %151, float 0x3EFAEA6680000000, float 0xBF56C9E760000000)
  %157 = tail call float @llvm.fmuladd.f32(float %151, float %156, float 0x3FA5557EE0000000)
  %158 = tail call float @llvm.fmuladd.f32(float %151, float %157, float 0xBFE0000080000000)
  %159 = tail call float @llvm.fmuladd.f32(float %151, float %158, float 1.000000e+00)
  %160 = and i32 %150, 1
  %161 = icmp eq i32 %160, 0
  %162 = select i1 %161, float %155, float %159
  %163 = bitcast float %162 to i32
  %164 = shl i32 %150, 30
  %165 = and i32 %164, -2147483648
  %166 = bitcast float %30 to i32
  %167 = xor i32 %148, %166
  %168 = xor i32 %167, %165
  %169 = xor i32 %168, %163
  %170 = bitcast i32 %169 to float
  %171 = tail call i1 @llvm.amdgcn.class.f32(float %31, i32 504)
  %172 = select i1 %171, float %170, float 0x7FF8000000000000
  %173 = getelementptr inbounds float, float addrspace(1)* %3, i64 %28
  store float %172, float addrspace(1)* %173, align 4, !tbaa !16
  br label %174

174:                                              ; preds = %147, %5
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
declare align 4 i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

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
!6 = !{!7, !11, i64 12}
!7 = !{!"hsa_kernel_dispatch_packet_s", !8, i64 0, !8, i64 2, !8, i64 4, !8, i64 6, !8, i64 8, !8, i64 10, !11, i64 12, !11, i64 16, !11, i64 20, !11, i64 24, !11, i64 28, !12, i64 32, !13, i64 40, !12, i64 48, !14, i64 56}
!8 = !{!"short", !9, i64 0}
!9 = !{!"omnipotent char", !10, i64 0}
!10 = !{!"Simple C/C++ TBAA"}
!11 = !{!"int", !9, i64 0}
!12 = !{!"long", !9, i64 0}
!13 = !{!"any pointer", !9, i64 0}
!14 = !{!"hsa_signal_s", !12, i64 0}
!15 = !{i32 0, i32 1024}
!16 = !{!17, !17, i64 0}
!17 = !{!"float", !18, i64 0}
!18 = !{!"omnipotent char", !19, i64 0}
!19 = !{!"Simple C++ TBAA"}
!20 = !{i32 0, i32 33}
