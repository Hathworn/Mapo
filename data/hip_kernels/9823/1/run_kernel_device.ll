; ModuleID = '../data/hip_kernels/9823/1/main.cu'
source_filename = "../data/hip_kernels/9823/1/main.cu"
target datalayout = "e-p:64:64-p1:64:64-p2:32:32-p3:32:32-p4:64:64-p5:32:32-p6:32:32-i64:64-v16:16-v24:32-v32:32-v48:64-v96:128-v192:256-v256:256-v512:512-v1024:1024-v2048:2048-n32:64-S32-A5-G1-ni:7"
target triple = "amdgcn-amd-amdhsa"

%struct.hiprandStateMRG32k3a = type { %"class.rocrand_device::mrg32k3a_engine" }
%"class.rocrand_device::mrg32k3a_engine" = type { %"struct.rocrand_device::mrg32k3a_engine::mrg32k3a_state" }
%"struct.rocrand_device::mrg32k3a_engine::mrg32k3a_state" = type { [3 x i32], [3 x i32], i32, i32, float, double }

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.start.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: argmemonly mustprogress nocallback nofree nosync nounwind willreturn
declare void @llvm.lifetime.end.p5i8(i64 immarg, i8 addrspace(5)* nocapture) #0

; Function Attrs: convergent mustprogress norecurse nounwind
define protected amdgpu_kernel void @_Z10run_kernelP20hiprandStateMRG32k3aPj(%struct.hiprandStateMRG32k3a addrspace(1)* nocapture %0, i32 addrspace(1)* nocapture writeonly %1) local_unnamed_addr #1 {
  %3 = alloca { i32, i32, float, double }, align 8, addrspace(5)
  %4 = tail call i32 @llvm.amdgcn.workitem.id.x(), !range !4
  %5 = tail call i32 @llvm.amdgcn.workgroup.id.x()
  %6 = shl i32 %5, 8
  %7 = add i32 %6, %4
  %8 = bitcast { i32, i32, float, double } addrspace(5)* %3 to i8 addrspace(5)*
  call void @llvm.lifetime.start.p5i8(i64 24, i8 addrspace(5)* %8)
  %9 = sext i32 %7 to i64
  %10 = getelementptr inbounds %struct.hiprandStateMRG32k3a, %struct.hiprandStateMRG32k3a addrspace(1)* %0, i64 %9, i32 0, i32 0, i32 0, i64 0
  %11 = load i32, i32 addrspace(1)* %10, align 8
  %12 = getelementptr inbounds %struct.hiprandStateMRG32k3a, %struct.hiprandStateMRG32k3a addrspace(1)* %0, i64 %9, i32 0, i32 0, i32 0, i64 1
  %13 = load i32, i32 addrspace(1)* %12, align 4
  %14 = getelementptr inbounds %struct.hiprandStateMRG32k3a, %struct.hiprandStateMRG32k3a addrspace(1)* %0, i64 %9, i32 0, i32 0, i32 0, i64 2
  %15 = load i32, i32 addrspace(1)* %14, align 8
  %16 = getelementptr inbounds %struct.hiprandStateMRG32k3a, %struct.hiprandStateMRG32k3a addrspace(1)* %0, i64 %9, i32 0, i32 0, i32 1, i64 0
  %17 = load i32, i32 addrspace(1)* %16, align 4
  %18 = getelementptr inbounds %struct.hiprandStateMRG32k3a, %struct.hiprandStateMRG32k3a addrspace(1)* %0, i64 %9, i32 0, i32 0, i32 1, i64 1
  %19 = load i32, i32 addrspace(1)* %18, align 8
  %20 = getelementptr inbounds %struct.hiprandStateMRG32k3a, %struct.hiprandStateMRG32k3a addrspace(1)* %0, i64 %9, i32 0, i32 0, i32 1, i64 2
  %21 = load i32, i32 addrspace(1)* %20, align 4
  %22 = getelementptr inbounds %struct.hiprandStateMRG32k3a, %struct.hiprandStateMRG32k3a addrspace(1)* %0, i64 %9, i32 0, i32 0, i32 2
  %23 = bitcast i32 addrspace(1)* %22 to i8 addrspace(1)*
  call void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noundef align 8 dereferenceable(24) %8, i8 addrspace(1)* noundef align 8 dereferenceable(24) %23, i64 24, i1 false)
  %24 = sub i32 -209, %11
  %25 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 810728, i32 %24, i64 0) #4, !srcloc !5
  %26 = extractvalue { i64, i64 } %25, 0
  %27 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 1403580, i32 %13, i64 %26) #4, !srcloc !5
  %28 = extractvalue { i64, i64 } %27, 0
  %29 = lshr i64 %28, 32
  %30 = trunc i64 %29 to i32
  %31 = and i64 %28, 4294967295
  %32 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 209, i32 %30, i64 %31) #4, !srcloc !5
  %33 = extractvalue { i64, i64 } %32, 0
  %34 = icmp ugt i64 %33, 4294967086
  %35 = add i64 %33, -4294967087
  %36 = select i1 %34, i64 %35, i64 %33
  %37 = trunc i64 %36 to i32
  %38 = sub i32 -22853, %17
  %39 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 1370589, i32 %38, i64 0) #4, !srcloc !5
  %40 = extractvalue { i64, i64 } %39, 0
  %41 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 527612, i32 %21, i64 %40) #4, !srcloc !5
  %42 = extractvalue { i64, i64 } %41, 0
  %43 = lshr i64 %42, 32
  %44 = trunc i64 %43 to i32
  %45 = and i64 %42, 4294967295
  %46 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 22853, i32 %44, i64 %45) #4, !srcloc !5
  %47 = extractvalue { i64, i64 } %46, 0
  %48 = lshr i64 %47, 32
  %49 = trunc i64 %48 to i32
  %50 = and i64 %47, 4294967295
  %51 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 22853, i32 %49, i64 %50) #4, !srcloc !5
  %52 = extractvalue { i64, i64 } %51, 0
  %53 = icmp ugt i64 %52, 4294944442
  %54 = add i64 %52, -4294944443
  %55 = select i1 %53, i64 %54, i64 %52
  %56 = trunc i64 %55 to i32
  %57 = sub i64 %36, %55
  %58 = icmp ugt i32 %37, %56
  %59 = select i1 %58, i64 0, i64 4294967087
  %60 = add i64 %57, %59
  %61 = trunc i64 %60 to i32
  %62 = add i32 %61, -1
  %63 = uitofp i32 %62 to double
  %64 = fmul contract double %63, 0x3FF000000D10000B
  %65 = fptoui double %64 to i32
  %66 = icmp eq i32 %65, 0
  br i1 %66, label %67, label %120

67:                                               ; preds = %2, %67
  %68 = phi i32 [ %69, %67 ], [ %13, %2 ]
  %69 = phi i32 [ %70, %67 ], [ %15, %2 ]
  %70 = phi i32 [ %87, %67 ], [ %37, %2 ]
  %71 = phi i32 [ %72, %67 ], [ %19, %2 ]
  %72 = phi i32 [ %73, %67 ], [ %21, %2 ]
  %73 = phi i32 [ %106, %67 ], [ %56, %2 ]
  %74 = sub i32 -209, %68
  %75 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 810728, i32 %74, i64 0) #4, !srcloc !5
  %76 = extractvalue { i64, i64 } %75, 0
  %77 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 1403580, i32 %69, i64 %76) #4, !srcloc !5
  %78 = extractvalue { i64, i64 } %77, 0
  %79 = lshr i64 %78, 32
  %80 = trunc i64 %79 to i32
  %81 = and i64 %78, 4294967295
  %82 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 209, i32 %80, i64 %81) #4, !srcloc !5
  %83 = extractvalue { i64, i64 } %82, 0
  %84 = icmp ugt i64 %83, 4294967086
  %85 = add i64 %83, -4294967087
  %86 = select i1 %84, i64 %85, i64 %83
  %87 = trunc i64 %86 to i32
  %88 = sub i32 -22853, %71
  %89 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 1370589, i32 %88, i64 0) #4, !srcloc !5
  %90 = extractvalue { i64, i64 } %89, 0
  %91 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 527612, i32 %73, i64 %90) #4, !srcloc !5
  %92 = extractvalue { i64, i64 } %91, 0
  %93 = lshr i64 %92, 32
  %94 = trunc i64 %93 to i32
  %95 = and i64 %92, 4294967295
  %96 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 22853, i32 %94, i64 %95) #4, !srcloc !5
  %97 = extractvalue { i64, i64 } %96, 0
  %98 = lshr i64 %97, 32
  %99 = trunc i64 %98 to i32
  %100 = and i64 %97, 4294967295
  %101 = tail call { i64, i64 } asm sideeffect "v_mad_u64_u32 $0, $1, $2, $3, $4", "=v,=s,r,v,v"(i32 22853, i32 %99, i64 %100) #4, !srcloc !5
  %102 = extractvalue { i64, i64 } %101, 0
  %103 = icmp ugt i64 %102, 4294944442
  %104 = add i64 %102, -4294944443
  %105 = select i1 %103, i64 %104, i64 %102
  %106 = trunc i64 %105 to i32
  %107 = sub i64 %86, %105
  %108 = icmp ugt i32 %87, %106
  %109 = select i1 %108, i64 0, i64 4294967087
  %110 = add i64 %107, %109
  %111 = trunc i64 %110 to i32
  %112 = add i32 %111, -1
  %113 = uitofp i32 %112 to double
  %114 = fmul contract double %113, 0x3FF000000D10000B
  %115 = fptoui double %114 to i32
  %116 = icmp eq i32 %115, 0
  br i1 %116, label %67, label %117, !llvm.loop !6

117:                                              ; preds = %67
  %118 = trunc i64 %86 to i32
  %119 = trunc i64 %105 to i32
  br label %120

120:                                              ; preds = %117, %2
  %121 = phi i32 [ %119, %117 ], [ %56, %2 ]
  %122 = phi i32 [ %73, %117 ], [ %21, %2 ]
  %123 = phi i32 [ %72, %117 ], [ %19, %2 ]
  %124 = phi i32 [ %118, %117 ], [ %37, %2 ]
  %125 = phi i32 [ %70, %117 ], [ %15, %2 ]
  %126 = phi i32 [ %69, %117 ], [ %13, %2 ]
  %127 = phi i32 [ %115, %117 ], [ %65, %2 ]
  store i32 %126, i32 addrspace(1)* %10, align 8
  store i32 %125, i32 addrspace(1)* %12, align 4
  store i32 %124, i32 addrspace(1)* %14, align 8
  store i32 %123, i32 addrspace(1)* %16, align 4
  store i32 %122, i32 addrspace(1)* %18, align 8
  store i32 %121, i32 addrspace(1)* %20, align 4
  call void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noundef align 8 dereferenceable(24) %23, i8 addrspace(5)* noundef align 8 dereferenceable(24) %8, i64 24, i1 false)
  %128 = getelementptr inbounds i32, i32 addrspace(1)* %1, i64 %9
  store i32 %127, i32 addrspace(1)* %128, align 4, !tbaa !8
  call void @llvm.lifetime.end.p5i8(i64 24, i8 addrspace(5)* %8)
  ret void
}

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workitem.id.x() #2

; Function Attrs: mustprogress nofree nosync nounwind readnone speculatable willreturn
declare i32 @llvm.amdgcn.workgroup.id.x() #2

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p5i8.p1i8.i64(i8 addrspace(5)* noalias nocapture writeonly, i8 addrspace(1)* noalias nocapture readonly, i64, i1 immarg) #3

; Function Attrs: argmemonly nocallback nofree nounwind willreturn
declare void @llvm.memcpy.p1i8.p5i8.i64(i8 addrspace(1)* noalias nocapture writeonly, i8 addrspace(5)* noalias nocapture readonly, i64, i1 immarg) #3

attributes #0 = { argmemonly mustprogress nocallback nofree nosync nounwind willreturn }
attributes #1 = { convergent mustprogress norecurse nounwind "amdgpu-flat-work-group-size"="1,256" "frame-pointer"="none" "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="gfx906" "target-features"="+16-bit-insts,+ci-insts,+dl-insts,+dot1-insts,+dot2-insts,+dot7-insts,+dpp,+flat-address-space,+gfx8-insts,+gfx9-insts,+s-memrealtime,+s-memtime-inst,+sramecc" "uniform-work-group-size"="true" }
attributes #2 = { mustprogress nofree nosync nounwind readnone speculatable willreturn }
attributes #3 = { argmemonly nocallback nofree nounwind willreturn }
attributes #4 = { convergent nounwind }

!llvm.module.flags = !{!0, !1}
!opencl.ocl.version = !{!2}
!llvm.ident = !{!3}

!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 1}
!2 = !{i32 2, i32 0}
!3 = !{!"clang version 15.0.0 (http://10.15.3.7/dcutoolkit/driverruntime/llvm-project.git 340750feeda88c9c2ce8ad481b11d9aa7f033d39)"}
!4 = !{i32 0, i32 1024}
!5 = !{i64 5995743}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.mustprogress"}
!8 = !{!9, !9, i64 0}
!9 = !{!"int", !10, i64 0}
!10 = !{!"omnipotent char", !11, i64 0}
!11 = !{!"Simple C++ TBAA"}
