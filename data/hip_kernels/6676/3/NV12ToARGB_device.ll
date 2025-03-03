; ModuleID = '../data/hip_kernels/6676/3/main.cu'
source_filename = "../data/hip_kernels/6676/3/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

@constAlpha = protected addrspace(4) externally_initialized global i32 0, align 4
@constHueColorSpaceMat = protected local_unnamed_addr addrspace(4) externally_initialized global [9 x float] zeroinitializer, align 16
@llvm.compiler.used = appending addrspace(1) global [1 x i8*] [i8* addrspacecast (i8 addrspace(4)* bitcast (i32 addrspace(4)* @constAlpha to i8 addrspace(4)*) to i8*)], section "llvm.metadata"

; Function Attrs: argmemonly mustprogress nofree norecurse nosync nounwind willreturn
define protected amdgpu_kernel void @_Z10NV12ToARGBPjmS_mjj(i32 addrspace(1)* nocapture readonly %0, i64 %1, i32 addrspace(1)* nocapture writeonly %2, i64 %3, i32 %4, i32 %5) local_unnamed_addr #0 {
  %7 = lshr i64 %3, 2
  %8 = trunc i64 %7 to i32
  %9 = bitcast i32 addrspace(1)* %0 to i8 addrspace(1)*
  %10 = trunc i64 %1 to i32
  %11 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %12 = tail call align 4 dereferenceable(64) i8 addrspace(4)* @llvm.amdgcn.dispatch.ptr()
  %13 = getelementptr i8, i8 addrspace(4)* %12, i64 4
  %14 = bitcast i8 addrspace(4)* %13 to i16 addrspace(4)*
  %15 = load i16, i16 addrspace(4)* %14, align 4, !range !4, !invariant.load !5
  %16 = shl nuw nsw i16 %15, 1
  %17 = zext i16 %16 to i32
  %18 = mul i32 %11, %17
  %19 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !6
  %20 = shl nuw nsw i32 %19, 1
  %21 = add i32 %18, %20
  %22 = tail call i32 @llvm.amdgcn.workgroup.id.y()
  %23 = getelementptr i8, i8 addrspace(4)* %12, i64 6
  %24 = bitcast i8 addrspace(4)* %23 to i16 addrspace(4)*
  %25 = load i16, i16 addrspace(4)* %24, align 2, !range !4, !invariant.load !5
  %26 = zext i16 %25 to i32
  %27 = mul i32 %22, %26
  %28 = tail call i32 @llvm.amdgcn.workitem.id.y(), !range !6
  %29 = add i32 %27, %28
  %30 = icmp ult i32 %21, %4
  %31 = icmp ult i32 %29, %5
  %32 = select i1 %30, i1 %31, i1 false
  br i1 %32, label %33, label %157

33:                                               ; preds = %6
  %34 = mul i32 %29, %10
  %35 = add i32 %34, %21
  %36 = zext i32 %35 to i64
  %37 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 %36
  %38 = load i8, i8 addrspace(1)* %37, align 1, !tbaa !7, !amdgpu.noclobber !5
  %39 = zext i8 %38 to i32
  %40 = shl nuw nsw i32 %39, 2
  %41 = add i32 %35, 1
  %42 = zext i32 %41 to i64
  %43 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 %42
  %44 = load i8, i8 addrspace(1)* %43, align 1, !tbaa !7, !amdgpu.noclobber !5
  %45 = zext i8 %44 to i32
  %46 = shl nuw nsw i32 %45, 2
  %47 = mul i32 %10, %5
  %48 = ashr i32 %29, 1
  %49 = and i32 %29, 1
  %50 = icmp eq i32 %49, 0
  %51 = mul i32 %48, %10
  %52 = add i32 %21, %47
  %53 = add i32 %52, %51
  %54 = zext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 %54
  %56 = load i8, i8 addrspace(1)* %55, align 1, !tbaa !7
  %57 = zext i8 %56 to i32
  %58 = add i32 %53, 1
  %59 = zext i32 %58 to i64
  %60 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 %59
  %61 = load i8, i8 addrspace(1)* %60, align 1, !tbaa !7
  %62 = zext i8 %61 to i32
  br i1 %50, label %86, label %63

63:                                               ; preds = %33
  %64 = lshr i32 %5, 1
  %65 = add nsw i32 %64, -1
  %66 = icmp ult i32 %48, %65
  br i1 %66, label %67, label %86

67:                                               ; preds = %63
  %68 = add nsw i32 %48, 1
  %69 = mul i32 %68, %10
  %70 = add i32 %52, %69
  %71 = zext i32 %70 to i64
  %72 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 %71
  %73 = load i8, i8 addrspace(1)* %72, align 1, !tbaa !7, !amdgpu.noclobber !5
  %74 = zext i8 %73 to i32
  %75 = add nuw nsw i32 %57, 1
  %76 = add nuw nsw i32 %75, %74
  %77 = lshr i32 %76, 1
  %78 = add i32 %70, 1
  %79 = zext i32 %78 to i64
  %80 = getelementptr inbounds i8, i8 addrspace(1)* %9, i64 %79
  %81 = load i8, i8 addrspace(1)* %80, align 1, !tbaa !7, !amdgpu.noclobber !5
  %82 = zext i8 %81 to i32
  %83 = add nuw nsw i32 %62, 1
  %84 = add nuw nsw i32 %83, %82
  %85 = lshr i32 %84, 1
  br label %86

86:                                               ; preds = %33, %63, %67
  %87 = phi i32 [ %85, %67 ], [ %62, %63 ], [ %62, %33 ]
  %88 = phi i32 [ %77, %67 ], [ %57, %63 ], [ %57, %33 ]
  %89 = shl nuw nsw i32 %88, 12
  %90 = shl nuw nsw i32 %87, 22
  %91 = or i32 %90, %89
  %92 = shl nuw nsw i32 %88, 2
  %93 = and i32 %92, 1020
  %94 = lshr i32 %91, 20
  %95 = uitofp i32 %40 to float
  %96 = uitofp i32 %93 to float
  %97 = fadd contract float %96, -5.120000e+02
  %98 = uitofp i32 %94 to float
  %99 = fadd contract float %98, -5.120000e+02
  %100 = fmul contract float %99, 0x3FF23D70A0000000
  %101 = fadd contract float %100, %95
  %102 = fmul contract float %97, 0x3FD947AE20000000
  %103 = fsub contract float %95, %102
  %104 = fmul contract float %99, 0x3FE2978D40000000
  %105 = fsub contract float %103, %104
  %106 = fmul contract float %97, 0x4000418940000000
  %107 = fadd contract float %106, %95
  %108 = uitofp i32 %46 to float
  %109 = fadd contract float %100, %108
  %110 = fsub contract float %108, %102
  %111 = fsub contract float %110, %104
  %112 = fadd contract float %106, %108
  %113 = load i32, i32 addrspace(4)* @constAlpha, align 4, !tbaa !10
  %114 = tail call float @llvm.maxnum.f32(float %101, float 0.000000e+00)
  %115 = tail call float @llvm.minnum.f32(float %114, float 1.023000e+03)
  %116 = tail call float @llvm.maxnum.f32(float %105, float 0.000000e+00)
  %117 = tail call float @llvm.minnum.f32(float %116, float 1.023000e+03)
  %118 = tail call float @llvm.maxnum.f32(float %107, float 0.000000e+00)
  %119 = tail call float @llvm.minnum.f32(float %118, float 1.023000e+03)
  %120 = fptoui float %115 to i32
  %121 = shl i32 %120, 22
  %122 = and i32 %121, -16777216
  %123 = fptoui float %117 to i32
  %124 = shl i32 %123, 14
  %125 = and i32 %124, -65536
  %126 = fptoui float %119 to i32
  %127 = shl i32 %126, 6
  %128 = and i32 %127, -256
  %129 = or i32 %122, %128
  %130 = or i32 %129, %125
  %131 = or i32 %130, %113
  %132 = mul i32 %29, %8
  %133 = add i32 %132, %21
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %134
  store i32 %131, i32 addrspace(1)* %135, align 4, !tbaa !10
  %136 = tail call float @llvm.maxnum.f32(float %109, float 0.000000e+00)
  %137 = tail call float @llvm.minnum.f32(float %136, float 1.023000e+03)
  %138 = tail call float @llvm.maxnum.f32(float %111, float 0.000000e+00)
  %139 = tail call float @llvm.minnum.f32(float %138, float 1.023000e+03)
  %140 = tail call float @llvm.maxnum.f32(float %112, float 0.000000e+00)
  %141 = tail call float @llvm.minnum.f32(float %140, float 1.023000e+03)
  %142 = fptoui float %137 to i32
  %143 = shl i32 %142, 22
  %144 = and i32 %143, -16777216
  %145 = fptoui float %139 to i32
  %146 = shl i32 %145, 14
  %147 = and i32 %146, -65536
  %148 = fptoui float %141 to i32
  %149 = shl i32 %148, 6
  %150 = and i32 %149, -256
  %151 = or i32 %144, %150
  %152 = or i32 %151, %147
  %153 = or i32 %152, %113
  %154 = add i32 %133, 1
  %155 = zext i32 %154 to i64
  %156 = getelementptr inbounds i32, i32 addrspace(1)* %2, i64 %155
  store i32 %153, i32 addrspace(1)* %156, align 4, !tbaa !10
  br label %157

157:                                              ; preds = %6, %86
  ret void
}

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.maxnum.f32(float, float) #1

; Function Attrs: mustprogress nocallback nofree nosync nounwind readnone speculatable willreturn
declare float @llvm.minnum.f32(float, float) #1

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
!4 = !{i16 1, i16 1025}
!5 = !{}
!6 = !{i32 0, i32 1024}
!7 = !{!8, !8, i64 0}
!8 = !{!"omnipotent char", !9, i64 0}
!9 = !{!"Simple C++ TBAA"}
!10 = !{!11, !11, i64 0}
!11 = !{!"int", !8, i64 0}
